module SwaggerRewriting (rewriteSwagger) where

import BasicPrelude hiding (decodeUtf8, encodeUtf8)
import Data.Aeson (Value)
import qualified Data.HashMap.Strict as HMS
import qualified Data.Text as T
import Lens.Micro ((%~), (.~))
import Lens.Micro.Aeson (key, _Object, _String)


-- Rewrites the Swagger entry to:
-- - have sane operation IDs
-- - TODO: filter out operations with unsupported binary params
rewriteSwagger :: Value -> Value
rewriteSwagger = rewriteOperationIDs

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
  transformOperation path method = (key "operationId" . _String) .~ generateOperationId path method

  -- heuristically generate a better operation ID
  generateOperationId :: Text -> Text -> Text
  generateOperationId path method
    = concat (T.toLower method : path')
    where
      path'
        = map T.toTitle
        . filter (not . T.isPrefixOf "{")
        $ splitPath path

-- Reimplementation of splitPath from filepath to work on Text
splitPath :: Text -> [Text]
splitPath = T.splitOn "/"

