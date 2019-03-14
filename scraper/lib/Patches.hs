{-# LANGUAGE Rank2Types #-}

-- This module contains logic for patching the input files
-- Expressing the changes in terms of structure rather than text makes them more robust against unrelated changes,
-- but means that we need to implement our own logic for recognizing when the surrounding document has changed.
module Patches (patchDocs, patchSwagger) where

import BasicPrelude
import Data.Aeson (Value(..))
import qualified Data.Text as T
import qualified Data.Vector as V
import Lens.Micro((.~), (%~), (&), Traversal', filtered, toListOf, at, has, each)
import Lens.Micro.Aeson (_Object, _Array, _String, key, values)
import Lens.Micro.Platform ()

import Util


-- Swagger patches.
-- This fixes the mismatch between the path present in the key, and the explicit defn of the path params
patchSwagger :: Value -> Value
patchSwagger = key "paths" %~ pathModifier where
  pathModifier
    = foldl' (.) id
    . map applyPatch
    $ [
        ( key "/boards/{id}/memberships/{idMembership}"
          .  key "put"
          .  key "parameters"
          .  valuesWith "name" "idMembership"
          .  keyAt "in"
          .~ Just (String "path")
        ), (
          key "/boards/{boardId}/boardStars"
          .  key "get"
          .  keyAt "summary"
          .~ Just (String "/boards/{boardId}/boardStars")
        ), (
          key "/boards/{boardId}/boardStars"
          .  key "get"
          .  key "parameters"
          .  valuesWith "name" "filter"
          .  keyAt "in"
          .~ Just (String "query")
        ), (
          key "/enterprises/{id}/members/{idMember}"
          .  key "get"
          .  key "parameters"
          .  valuesWith "name" "idMember"
          .  keyAt "in"
          .~ Just (String "path")
        ), (
          key "/members/{id}/savedSearches/{idSearch}"
          .  key "get"
          .  key "parameters"
          .  _Array
          %~ V.cons (mkPathParam "idSearch" "The ID of the search")
        ), (
          key "/members/{id}/savedSearches/{idSearch}"
          .  key "put"
          .  key "parameters"
          .  _Array
          %~ V.cons (mkPathParam "idSearch" "The ID of the search")
        ), (
          key "/members/{id}//customBoardBackgrounds/{idBackground}"
          .  key "put"
          .  key "parameters"
          .  _Array
          %~ V.cons (mkPathParam "idBackground" "The ID of the background")
        ), (
          key "/members/{id}/customBoardBackgrounds/{idBackground}"
          .  key "get"
          .  key "parameters"
          .  _Array
          %~ V.cons (mkPathParam "idBackground" "The ID of the background")
        ), (
          key "/enterprises/{id}/organizations/{idOrganization}"
          .  key "delete"
          .  key "summary"
          .~ String "/enterprises/{id}/organizations/{idOrganization}"
        ), (
          key "/enterprises/{id}/organizations/{idOrganization}"
          .  key "delete"
          .  key "parameters"
          .  _Array
          %~ (V.filter ((/=) (Just "idMember") . getStringKey "name")
              . V.cons (mkPathParam "idOrganization" "The ID of the organization")
          )
        ), (
          key "/cards/{id}/attachments"
          .  key "get"
          .  key "parameters"
          .  valuesWith "name" "fields"
          .  keyAt "in"
          .~ Just (String "query")
        ), (
          key "/cards/{id}/attachments"
          .  key "get"
          .  key "parameters"
          .  valuesWith "name" "filter"
          .  keyAt "in"
          .~ Just (String "query")
        )
      ]

  -- Sanity check for patches that don't work as expected
  applyPatch f x = y' where
    y = f x
    y' | x == y    = error "Patch was a no-op"
       | otherwise = y

  mkPathParam name description
    = mkObject [
        ("required", Bool True),
        ("schema", mkSimpleObject "type" "string"),
        ("in", "path"),
        ("name", name),
        ("description", description)
      ]


-- Because docs can be nested, the patching logic here needs to be applied recursively
patchDocs :: Value -> IO Value
patchDocs docs = do
  -- JSON does not permit trailing commas
  let removeExtraComma
        =  hasKV "_id" "595aba4f06f0d400155af9a7"
        .  key "api"
        .  key "results"
        .  key "codes"
        .  valuesWith' "status" (Number 200)
        .  key "code"
        .  _String
        %~ assertReplacing
           "[\n    {\n        \"callbackURL\": \"https://trello.com/\",\n    }\n]"
           "[\n    {\n        \"callbackURL\": \"https://trello.com/\"\n    }\n]"

  -- These two are just typos
  removeExtraQuote  <- assertReplacingWithFiles "5b6345d62f1997000328177f" "removeExtraQuote"
  addMissingComma   <- assertReplacingWithFiles "594d1946f45834003df50221" "addMissingComma"
  jsonifyBoardStars <- assertReplacingWithFiles "59540344341432001554ebac" "jsonifyBoardStars"

  return
    $ mapDocsRecursively (
      removeExtraQuote
      . removeExtraComma
      . addMissingComma
      . jsonifyBoardStars
    ) docs

-- Apply the specified transformaion to the root and all its (transitive children)
mapDocsRecursively :: (Value -> Value) -> (Value -> Value)
mapDocsRecursively f root
  | has _Object root
    = (key "children"      . values %~ f)
    . (key "childrenPages" . values %~ f)
    $ f root
  | has _Array root
    =  root
    &  _Array
    .  each
    %~ mapDocsRecursively f
  | otherwise = error $ "Expected object, got " ++ show root

-- Expects a given value and returns the replacement. Errors out if the expected value is not provided.
assertReplacing :: Text -> Text -> Text -> Text
assertReplacing expected new old
  | expected == old = new
  | otherwise       = error errMsg
  where
    errMsg
      = concat [
          "Expected:\n",
          show expected,
          "\nBut got:\n",
          show new,
          "\ndiffering at index ",
          show i,
          ":\n",
          show $ T.take (i + 10) expected,
          "\n",
          show $ T.take (i + 10) old,
          "\n",
          "Lengths were: ",
          show $ T.length expected,
          ", ",
          show $ T.length old
        ]
    i = case T.commonPrefixes expected old of
             Just (prefix, _, _) -> T.length prefix
             Nothing             -> 0

-- Some blobs are too large to reasonable embed in source, so we store in them in separate files
assertReplacingWithFiles :: Text -> FilePath -> IO (Value -> Value)
assertReplacingWithFiles _id filename = do
    -- Need to drop the trailing newline for equivalence reasons
    old <- T.stripEnd <$> readFile ("scraper/patches/" ++ filename ++ "_old.txt")
    new <- T.stripEnd <$> readFile ("scraper/patches/" ++ filename ++ "_new.txt")

    return
      $ hasKV "_id" _id
      . key "body"
      . _String
      %~ assertReplacing old new

-- Traverse into the element(s) of an array which contain the specified key-value pair
valuesWith :: Text -> Text -> Traversal' Value Value
valuesWith k = valuesWith' k . String

-- Traverse into the element(s) of an array which contain the specified key-value pair. (General form)
valuesWith' :: Text -> Value -> Traversal' Value Value
valuesWith' k v
  = values
  . filtered (
      anyOr False
      . map (== v)
      . toListOf (key k)
  )

keyAt :: Text -> Traversal' Value (Maybe Value)
keyAt i = _Object . at i

hasKV :: Text -> Text -> Traversal' Value Value
hasKV k v = filtered $ (==) (Just v) . getStringKey k

