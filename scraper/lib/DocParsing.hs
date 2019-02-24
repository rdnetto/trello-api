module DocParsing (extractExampleResponses, extractCodeBlockContents, getResponse) where

import BasicPrelude hiding (encodeUtf8, takeWhile)
import Control.Applicative (many)
import Data.Aeson (FromJSON, Value(..), encode, eitherDecode)
import Data.Attoparsec.Text (parseOnly, endOfInput, manyTill, string, anyChar, takeWhile)
import qualified Data.ByteString.Lazy.Char8 as BSL
import qualified Data.HashMap.Strict as HMS
import qualified Data.Text as T
import Data.Text.Encoding (encodeUtf8)
import qualified Data.Vector as V
import Lens.Micro ((^..), (&), (^?), _Right, filtered)
import Lens.Micro.Aeson (_String, _Integer, key, values)
import Safe (fromJustNote)

import Util


-- Given a documentation blob, extracts a map of operation ID to sample response
extractExampleResponses :: Value -> HashMap Text Value
extractExampleResponses
  = HMS.fromList
  . catMaybes
  . map getResponse
  . filter (
    (==) "endpoint"
    . fromJustNote "Expected a single `type`"
    . getStringKey "type"
  )
  . getAllDocs


-- Traverse structure recursively to get a complete list of documents
-- TODO: make this recursive
getAllDocs :: Value -> [Value]
getAllDocs (Array v) = V.toList v
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
  return (operationId, decoder json)


-- Gets a sample response from the documentation body
getResponseFromBody :: Value -> Maybe (Text, Value)
getResponseFromBody obj = do
  operationId <- getStringKey "slug" obj
  body <- getStringKey "body" obj
  guard $ body /= ""

  codeBlockContents :: [Text]
    <- extractCodeBlockContents body ^? _Right

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
extractCodeBlockContents :: Text -> Either String [Text]
extractCodeBlockContents raw = parseOnly codeBlockParser raw

-- TODO: this isn't handling the non-matching case correctly
codeBlockParser :: Parser [Text]
codeBlockParser = (codeBlockParser <|> whatever) <* endOfInput
  codeBlockParser = many $ do
    void $ manyTill anyChar (string "[block:code]")
    txt <- manyTill anyChar (string "[/block]")
    return $ T.pack txt

  -- If there are no code blocks, we still want the parse to succeed
  whatever = takeWhile (const True) >> pure []

-- Determines if a given code block contains JSON
isJsonCodeBlob :: Value -> Bool
isJsonCodeBlob
  = (==) "json"
  . fromJustNote "Only one `language` expected"
  . getStringKey "language"


-- Generic helper for extracting a string from a JSOn object
getStringKey :: Text -> Value -> Maybe Text
getStringKey k obj
  =   zeroOrOne
  $   obj
  ^.. key k
  .   _String

zeroOrOne :: Show a => [a] -> Maybe a
zeroOrOne [x] = Just x
zeroOrOne []  = Nothing
zeroOrOne xs = error $ "Expected <2 results: " ++ show xs

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

