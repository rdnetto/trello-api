{-# LANGUAGE RankNTypes #-}

module DocParsing (extractExampleResponses, extractCodeBlockContents, getResponse) where

import BasicPrelude hiding (encodeUtf8)
import Data.Aeson (FromJSON, Value(..), encode, eitherDecode)
import qualified Data.ByteString.Lazy.Char8 as BSL
import qualified Data.HashMap.Strict as HMS
import qualified Data.Text as T
import Data.Text.Encoding (encodeUtf8)
import qualified Data.Vector as V
import Lens.Micro ((^..), (&), (^?), _Right, filtered, toListOf)
import Lens.Micro.Aeson (_String, _Integer, key, values)
import Safe (fromJustNote)
import Text.Parsec (ParseError, many, parse, eof, try, manyTill)
import Text.Parsec.Char (string, anyChar)

import Util


-- Given a documentation blob, extracts a map of operation ID to sample response
extractExampleResponses :: Value -> HashMap Text Value
extractExampleResponses
  = HMS.fromList
    . catMaybes
    . map getResponse
    . filter (orPreds [isEndpoint, isObject])
    . getAllDocs
  where
    -- Normal representation of an endpoint
    isEndpoint
      = (==) "endpoint"
        . fromJustNote "Expected a single `type`"
        . getStringKey "type"

    -- Explicit documentation of an "Object". e.g. the Action Object
    isObject
      = T.isSuffixOf "-object"
      . fromJustNote "Expected a single `slug`"
      . getStringKey "slug"


-- Traverse structure recursively to get a complete list of documents
getAllDocs :: Value -> [Value]
getAllDocs (Array v) = join . map f $ V.toList v where
  f :: Value -> [Value]
  f x = x : inner x

  inner :: Value -> [Value]
  inner
    = join
    . map f
    . toListOf
    (key "children" . values)
getAllDocs x = error $ "Invalid document root: " ++ show x


-- Converts a given document to a (operationId, exampleResponse)
getResponse :: Value -> Maybe (Text, Value)
getResponse obj = getResponseFromApi obj <|> getResponseFromBody obj

-- Gets a sample response from the api definition
--
-- Note that while it would make sense to construct the response definition
-- here (since it specifies the status codes), in practice the error case
-- is always documented as a 400 without a body.
getResponseFromApi :: Value -> Maybe (Text, Value)
getResponseFromApi obj = do
  operationId <- getStringKey "slug" obj
  let is200 x
        =  (x ^? key "status" . _Integer) == Just 200
        && (x ^? key "language" . _String) == Just "json"

  json <- obj
    ^? key "api"
    .  key "results"
    .  key "codes"
    .  values
    .  filtered is200
    .  key "code"
    .  _String

  -- Ignore empty strings
  guard . not $ T.null json

  let decoder = decodeJson $ "Failed to decode code blobs in " ++ renderJson obj
      res = decoder json

  -- Ignore empty objects too
  guard . not $ isEmptyObject res

  return (operationId, res)


-- Gets a sample response from the documentation body
getResponseFromBody :: Value -> Maybe (Text, Value)
getResponseFromBody obj = do
  operationId <- getStringKey "slug" obj
  body <- getStringKey "body" obj
  guard $ body /= ""

  -- Used for failure messages
  let objString
        = T.unpack
        . decodeUtf8
        . BSL.toStrict
        $ encode obj

  codeBlockContents :: [Text]
    <- extractCodeBlockContents objString body ^? _Right

  let decoder = decodeJson $ "Failed to decode code blobs in " ++ renderJson obj
      responses :: [Value]
        = codeBlockContents
        & map decoder
        & map (\blob -> blob ^.. key "codes" . values)
        & join
        & filter isJsonCodeBlob
        & map (getStringKey "code")
        & map (fromJustNote "Could not find `code` attribute")
        & map decoder

  case responses of
       -- Not all endpoints have example code blocks
       []  -> Nothing
       [x] -> Just (operationId, x)
       _   -> error $ "Could not find unique response for " ++ show obj

{- Body has the following structure:
   Optional header explaining stuff.
   [block:code]
   {
     "codes": [{
       "code": "$JSON",
       "language": "json"
     }]
   }
   [/block]

   Note that there may be multiple code blocks in some cases, though not all of them may be JSON.
   e.g. 'http' is used for examples of query params
-}
extractCodeBlockContents :: String -> Text -> Either ParseError [Text]
extractCodeBlockContents name raw = parse p name raw where
  p = (try codeBlockParser <|> whatever) <* eof
  codeBlockParser = many $ do
    void $ manyTill anyChar (try $ string "[block:code]")
    txt <- manyTill anyChar (try $ string "[/block]")
    return $ T.pack txt

  -- If there are no code blocks, we still want the parse to succeed
  whatever = many anyChar >> pure []

-- Determines if a given code block contains JSON
isJsonCodeBlob :: Value -> Bool
isJsonCodeBlob
  = (==) "json"
  . fromJustNote "Only one `language` expected"
  . getStringKey "language"


-- Deserializes a JSON snippet
decodeJson :: FromJSON a => String -> Text -> a
decodeJson err txt
  = fromRightNote (err ++ "\nJSON:\n" ++ T.unpack txt ++ "\n")
  . eitherDecode
  . BSL.fromStrict
  . encodeUtf8
  $ txt

-- Serializes a JSON snippet for error reporting
renderJson :: Value -> String
renderJson
  = T.unpack
  . decodeUtf8
  . BSL.toStrict
  . encode

  -- Compute the schema for responses from docs (not present in swagger)
  -- We exclude instances of {} since it's just a placeholder / represents ANY
  -- Note that responses can be things other than objects. e.g. arrays
isEmptyObject :: Value -> Bool
isEmptyObject (Object obj) = HMS.null obj
isEmptyObject _            = False

