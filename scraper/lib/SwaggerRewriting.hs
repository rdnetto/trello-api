module SwaggerRewriting (rewriteSwagger) where

import BasicPrelude hiding (decodeUtf8, encodeUtf8, stripPrefix)
import Control.Monad.Except (liftEither)
import Data.Aeson (Value(..))
import qualified Data.HashMap.Strict as HMS
import qualified Data.Set as S
import qualified Data.Text as T
import qualified Data.Vector as V
import Lens.Micro ((&), (.~), (^..), (^?), (%~), Traversal', _Left, filtered, has, at, ix, toListOf)
import Lens.Micro.Aeson (key, values, _Bool, _String, _Object)
import Lens.Micro.Extras (view)
import Lens.Micro.Platform ()
import Safe (fromJustNote, headNote)

import AesonMonad
import Util


-- Rewrites the Swagger entry to:
-- - have sane operation IDs
-- - filter out operations with unsupported binary params
-- - have sane response schemas
rewriteSwagger :: HashMap Text Value -> Value -> Either Text Value
rewriteSwagger responseSchemas obj
  = map snd
  . flip runAeson obj
  $ do
    -- Validation
    checkParamConsistency

    -- This needs to be done *before* we rewrite the operation IDs, since we correlate on them
    addResponseSchemas responseSchemas

    -- Handles the cases missed by addResponseSchemas
    fixMissingResponseSchemas responseSchemas

    -- Rewrite passes
    rewriteOperationIDs
    stripOptionalBinaryParams
    stripOperationsWithRequiredBinaryParams


-- Throws an error if a path implies a different set of params to what it actually uses
checkParamConsistency :: AesonM ()
checkParamConsistency = do
  out :: [Either Text ()]
      <- map concat
        . withChild "paths"
        . forEachKey $ \path ->
            forEachValue
            $ checkParams path

  void
    . liftEither
    . (_Left %~ T.intercalate "\n")
    $ batchEithers out

  where
    checkParams :: Text -> AesonM (Either Text ())
    checkParams path = do
      -- Params as defined in path
      let pathParams = S.fromList $ getPathParams path

      -- Params as defined in Swagger
      op <- getCurrent
      let swParams
            =   op
            ^.. opParams
            .   filtered isPathParam
            .   key "name"
            .   _String
            &   S.fromList

      if (pathParams == swParams)
         then pure (Right ())
         else do
           pathStr <- T.intercalate "." <$> getPath
           pure . Left $ concat [
               "Entry at ",
               pathStr,
               " has inconsistent definition of path params: ",
               tshow swParams
             ]

-- Replace the default, incomprehensible operation IDs with something better
-- e.g. instead of boardsboardididtags, use getBoardsTags
-- This is important because the operation IDs are used as function names.
--
-- value of interest is at ./paths/$PATH/$METHOD/operationId
rewriteOperationIDs :: AesonM  ()
rewriteOperationIDs
  = withChild "paths"
  . forEachKey_ $ \path ->
      forEachKey_ $ \method -> (do
          op <- getCurrent

          let pathParams
                = op
                ^.. opParams
                .   filtered isPathParam
                .   key "name"
                .   _String
              op'
                = op
                & (key "operationId" . _String) .~ generateOperationId path method pathParams

          setCurrent op'
        )

-- heuristically generate a better operation ID
generateOperationId :: Text -> Text -> [Text] -> Text
generateOperationId path method pathParams
  = concat (T.toLower method : path' ++ qualifier)
  where
    path'
      = (ix 0 %~ depluralize)       -- if the first word is in plural form, we usually want the singular
      . map T.toTitle
      . filter (not . T.null)
      . filter (not . T.isPrefixOf "{")
      $ splitPath path

    -- We get the params from parsing the string instead of from the actual object to ensure the order matches

    -- Include params in the name, for additional disambiguation
    -- We exclude params that start with `id`, as these are extremely common
    -- and typically duplicate info already present
    qualifier
      | length pathParams <= 1
        = []
      | otherwise
        = "By" : (
          map T.toTitle
        . map (stripPrefix "id")
        . map (stripSuffix "id")
        . filter (/= "id")
        $ pathParams
        )

-- Drops a prefix, if present
stripPrefix :: Text -> Text -> Text
stripPrefix p s | T.isPrefixOf p s = T.drop (T.length p) s
                | otherwise        = s

-- Drops a suffix, if present
stripSuffix :: Text -> Text -> Text
stripSuffix x s | T.isSuffixOf x s = T.dropEnd (T.length x) s
                | otherwise        = s

-- Reimplementation of splitPath from filepath to work on Text
splitPath :: Text -> [Text]
splitPath = T.splitOn "/"

-- Extracts the path params from the path string
getPathParams :: Text -> [Text]
getPathParams
  = map (stripPrefix "{")
  . map (stripSuffix "}")
  . filter (T.isPrefixOf "{")
  . splitPath


-- Since we currently don't support binary params, we either:
-- - filter out the param, if its optional
-- - filter out the entire operation

-- Remove optional binary params
-- values of interest are at ./paths/$PATH/$METHOD/parameters[]/
stripOptionalBinaryParams :: AesonM ()
stripOptionalBinaryParams
  = withChild "paths"
  . forEachValue_
  . forEachValue_
  . withChild "parameters"
  $ mapCurrent transformParams
  where
    transformParams :: Value -> Value
    transformParams (Array params) = Array $ V.filter pred params
    transformParams _ = error "Invalid type for params"

    pred p = not (isBinaryParam p && isOptionalParam p)

-- Removed operations containing required binary params
stripOperationsWithRequiredBinaryParams :: AesonM ()
stripOperationsWithRequiredBinaryParams
  -- ./paths/$PATH/$METHOD
  = withChild "paths"
  . forEachValue_
  . mapFilterChildren
  $ transformOperation
  where
    transformOperation :: Value -> Maybe Value
    transformOperation op = res where
      -- Required binary params
      required :: [Value]
      required
        =   op
        ^.. opParams
        .   filtered isBinaryParam
        .   filtered (not . isOptionalParam)

      res
        | null required = Just op
        | otherwise     = Nothing


-- Add inferred response schemas. responseSchemas is keyed on operationId
addResponseSchemas :: HashMap Text Value -> AesonM ()
addResponseSchemas responseSchemas
  = withChild "paths"
  . forEachKey_ $ \path ->
      forEachKey_ $ handler path
  where
    handler path method = do
      op <- getCurrent
      let operationId
            = fromJustNote ("No operation ID in " ++ show (path, method))
            $ op ^? key "operationId" . _String

      let (objName, pluralizer) = parsePath op
          schemas
            = catMaybes [
                HMS.lookup operationId responseSchemas,
                if (method == "get")
                   then pluralizer <$> HMS.lookup objName responseSchemas
                   else Nothing
              ]

      let f | key "responses" `has` op
              = id

            -- TODO: should probably be logging this, as it deserves a warning
            | null schemas
              = id

            -- We need to use `at` here to insert a new element
            | otherwise
              = _Object
              .  at "responses"
              .~ (Just . generateResponse $ head schemas)

      setCurrent $ f op

    -- Given the path, determines the object name that would match and a post-processing
    -- function if the result is a list
    parsePath op = (objName, pluralizer) where
      lastName
        = getLastName
        . view (key "_path" . _String)
        $ op

      lastName' = depluralize lastName
      objName   = lastName' ++ "-object"
      pluralizer
        | lastName == lastName' = id
        | otherwise             = mkArraySchema

      getLastName
        = last
        . filter (not . T.null)
        . filter (not . T.isPrefixOf "{")
        . T.splitOn "/"

-- Generate a Swagger response definition given a schema
-- See https://swagger.io/docs/specification/describing-responses/
generateResponse :: Value -> Value
generateResponse schema = res where
  res
    = mkSimpleObject "200"
    $ mkObject [
      ("description", String "OK"),
      ("content", content)
    ]
  content
    = mkSimpleObject "application/json"
    . mkSimpleObject "schema"
    $ schema


-- Sets some missing response schemas in terms of other inferred schemas
fixMissingResponseSchemas :: HashMap Text Value -> AesonM ()
fixMissingResponseSchemas responseSchemas = mapCurrent res where
  setResponse :: (Value -> Value) -> Text -> Text -> (Value -> Value)
  setResponse f path refName
    =  key "paths"
    .  key path
    .  key "get"
    .  _Object
    .  at "responses"
    .~ (Just
       . generateResponse
       . f
       . fromJustNote ("setResponse: " ++ show refName)
       $ HMS.lookup refName responseSchemas
       )

  getOrgMembership obj
    = headNote ("Failed to locate memberships in: " ++ show obj)
    . toListOf (key "properties" . key "memberships")
    $ obj

  res
    = setResponse id "/actions/{id}/memberCreator" "member-object"
    . setResponse id "/cards/{id}/attachments/{idAttachment}" "attachments"
    . setResponse mkArraySchema "/cards/{id}/membersVoted" "member-object"
    . setResponse unArraySchema "/cards/{id}/stickers/{idSticker}" "cardsidstickers"
    . setResponse unArraySchema "/checklists/{id}/checkItems/{idCheckItem}" "checklistsidcardscheckitems"
    . setResponse mkArraySchema "/enterprises/{id}/admins" "member-object"
    . setResponse unArraySchema "/members/{id}/boardStars/{idStar}" "membersidboardstars"
    . setResponse id "/notifications/{id}/memberCreator" "member-object"
    . setResponse mkArraySchema "/organizations/{id}/membersInvited" "member-object"
    . setResponse (mkArraySchema . getOrgMembership) "/organizations/{id}/memberships" "organization-object"
    . setResponse getOrgMembership "/organizations/{id}/memberships/{idMembership}" "organization-object"


-- Traversal for parameters on an operation.
opParams :: Traversal' Value Value
opParams
  = key "parameters"
  . values

-- Parameters are optional by default
isOptionalParam :: Value -> Bool
isOptionalParam
  = anyOr True
  . map not
  . (^.. key "required" . _Bool)

isBinaryParam :: Value -> Bool
isBinaryParam
  = anyOr False
  . map (== "binary")
  . (^.. key "schema" . key "format" . _String)

isPathParam :: Value -> Bool
isPathParam
  = anyOr False
  . map (== "path")
  . (^.. key "in")

-- Heuristically convert a plural form to a singular
depluralize :: Text -> Text
depluralize s
  | T.isSuffixOf "es" s = T.dropEnd 2 s
  | T.isSuffixOf "s"  s = T.dropEnd 1 s
  | otherwise           = s

-- Creates a Swagger schema for an array of the specified type
mkArraySchema :: Value -> Value
mkArraySchema itemSchema
  = mkObject [
      ("type", String "array"),
      ("items", itemSchema)
    ]

-- Given an array schema, returns the element type
unArraySchema :: Value -> Value
unArraySchema = expectOne . toListOf (key "items") where
  expectOne [x] = x
  expectOne xs  = error $ "Expected a unique element, got: " ++ show xs
