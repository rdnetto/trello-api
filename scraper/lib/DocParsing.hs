module DocParsing {- (extractExampleResponses, inferSchema) -} where

import BasicPrelude hiding (encodeUtf8)
import Data.Aeson (FromJSON, Value(..), encode, eitherDecode)
import qualified Data.ByteString.Lazy as BSL
import qualified Data.HashMap.Strict as HMS
import qualified Data.Text as T
import Data.Text.Encoding (encodeUtf8)
import qualified Data.Vector as V
import Lens.Micro ((^..), (&))
import Lens.Micro.Aeson (_String, key, values)
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
getResponse obj = do
  operationId <- getStringKey "slug" obj
  body <- getStringKey "body" obj
  guard $ body /= ""

  codeBlockContents :: [Text]
    <- (case extractCodeBlockContents (T.unpack . decodeUtf8 . BSL.toStrict $ encode obj) body of
            Right x -> Just x
            Left e -> traceShow e $ Nothing
       )

  let decoder = decodeJson $ "Failed to decode code blobs in " ++ show obj
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


-- TODO: given a JSON object, infer a schema for it
inferSchema :: Value -> Value
inferSchema = undefined


-- Generic helper for extracting a string from a JSOn object
getStringKey :: Text -> Value -> Maybe Text
getStringKey k obj
  =   zeroOrOne
  $   obj
  ^.. key k
  .   _String

-- Helper function for coercing the result of a traversal to a single value
singletonNote :: Show a => String -> [a] -> a
singletonNote _ [x] = x
singletonNote msg xs = error $ msg ++ ": " ++ show xs

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

