module SwaggerRewriting (rewriteSwagger) where

import BasicPrelude hiding (decodeUtf8, encodeUtf8, stripPrefix)
import Data.Aeson (Value)
import qualified Data.HashMap.Strict as HMS
import qualified Data.Text as T
import qualified Data.Vector as V
import Lens.Micro ((&), (%~), (.~), (^..), Traversal', filtered)
import Lens.Micro.Aeson (key, values, _Bool, _Object, _String, _Array)


-- Rewrites the Swagger entry to:
-- - have sane operation IDs
-- - filter out operations with unsupported binary params
rewriteSwagger :: Value -> Value
rewriteSwagger = rewriteOperationIDs . stripBinaryParams

-- Replace the default, incomprehensible operation IDs with something better
-- e.g. instead of boardsboardididtags, use getBoardsTags
-- This is important because the operation IDs are used as function names.
--
-- value of interest is at ./paths/$PATH/$METHOD/operationId
rewriteOperationIDs :: Value -> Value
rewriteOperationIDs = key "paths" . _Object %~ HMS.mapWithKey transformPath where
  transformPath :: Text -> Value -> Value
  transformPath path = _Object %~ HMS.mapWithKey (transformOperation path)

  transformOperation :: Text -> Text -> Value -> Value
  transformOperation path method op
    = op & (key "operationId" . _String) .~ generateOperationId path method pathParams
    where
      pathParams
        = op
        ^.. opParams
        .   filtered isPathParam
        .   key "name"
        .   _String

  -- heuristically generate a better operation ID
  generateOperationId :: Text -> Text -> [Text] -> Text
  generateOperationId path method pathParams
    = concat (T.toLower method : path' ++ qualifier)
    where
      path'
        = map T.toTitle
        . filter (not . T.isPrefixOf "{")
        $ splitPath path

      -- We get the params from parsing the string instead of from the actual object to ensure the order matches
      -- TODO

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


-- Helper type for the following logic
data ParamHandling
  = NoHandling        -- No-op
  | DropParam         -- Discard the param
  | DropOperation     -- Discard the operation
  deriving (Eq, Show)

-- Since we currently don't support binary params, we either:
-- - filter out the param, if its optional
-- - filter out the entire operation
stripBinaryParams :: Value -> Value
stripBinaryParams = key "paths" . _Object %~ HMS.map transformPath where

  transformPath :: Value -> Value
  transformPath = _Object %~ HMS.mapMaybe transformOperation

  transformOperation :: Value -> Maybe Value
  transformOperation op = op' where
    -- Required binary params
    binaryReqParams :: [Value]
    binaryReqParams
      =   op
      ^.. opParams
      .   filtered isBinaryParam
      .   filtered (not . isOptionalParam)

    -- Remove optional binary params
    strippedParams :: [Value]
    strippedParams
      =   op
      ^.. opParams
      -- Because we have already established that there are no required
      -- binary params when we use this, we can use a simplified test.
      .   filtered (not . isBinaryParam)

    -- If there are required binary params, we discard the operation completely,
    -- otherwise we simply filter out the optional ones (if any)
    op'
      | null binaryReqParams = op
                             & key "parameters" . _Array .~ V.fromList strippedParams
                             & Just
      | otherwise            = Nothing

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

-- b for the empty case, or any for non-empty case
anyOr :: Bool -> [Bool] -> Bool
anyOr b [] = b
anyOr _ xs = any id xs

