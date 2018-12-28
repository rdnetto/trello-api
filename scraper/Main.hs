{-# LANGUAGE TypeApplications #-}

module Main where

import BasicPrelude hiding (decodeUtf8, encodeUtf8)
import Data.Aeson (Value, eitherDecode')
import qualified Data.HashMap.Strict as HMS
import qualified Data.Map.Lazy as DML
import qualified Data.Text as T
import qualified Data.Text.Lazy as TL
import Data.Text.Lazy.Encoding (decodeUtf8, encodeUtf8)
import Data.Yaml (encodeFile)
import Lens.Micro((^.), (^?), _3)
import Lens.Micro.Aeson (_Object, key)
import Network.HTTP.Simple (httpLBS, getResponseBody, getResponseStatusCode)
import Text.HTML.Parser (Attr(..), Token(..), parseTokensLazy)

import HtmlDecoding


main :: IO ()
main = do
  html <- downloadDocs

  -- Rather than building up a syntax tree, we work directly with the tokens
  -- This has two advantages:
  --  - it works even in the presence of malformed trees (e.g. unclosed tags)
  --  - it is much simpler to stream
  putStrLn "Parsing"
  let swaggers = processHtml html

  swaggers' <- forM swaggers $ \(uid, sw) -> do
    let n = pathCount sw
    putStrLn $ concat [
        "File ",
        uid,
        " has ",
        tshow n,
        " paths"
      ]
    return (uid, sw, n)

  let (uid, selected, _) = maximumBy (compare `on` (^. _3)) swaggers'
  putStrLn $ "Selected " ++ uid ++ " - writing to swagger.yaml..."
  encodeFile "swagger.yaml" selected

processHtml :: LByteString -> [(Text, Value)]
processHtml html = swaggers where
  tokens
    = parseTokensLazy
    . decodeUtf8
    $ html

  swaggers
    = join
    . map DML.toList
    . map throwLeft
    -- Format is a map of UID to swagger object
    . map (eitherDecode' @ (Map Text Value))
    . map encodeUtf8
    . map TL.fromStrict
    . map htmlDecode
    . catMaybes
    . map handleToken
    $ tokens

downloadDocs :: IO LByteString
downloadDocs = do
    putStrLn "Downloading API docs..."
    response <- httpLBS "http://developers.trello.com/reference/"
    let statusCode = getResponseStatusCode response
    when (statusCode /= 200) $ error ("Received status code: " ++ show statusCode)
    return $ getResponseBody response

-- Matches `<script id="oasFiles" data-json="..." />` and extracts the contents
handleToken :: Token -> Maybe Text
handleToken (TagOpen name attrs) | (T.toLower name == "script")
  = do
    let attrs' = map (\(Attr k v) -> (k, v)) attrs
    tagId <- lookup "id" attrs'
    guard $ tagId == "oasFiles"
    lookup "data-json" attrs'
handleToken (TagSelfClose name attrs) = handleToken $ TagOpen name attrs
handleToken _ = Nothing

throwLeft :: Either String a -> a
throwLeft (Left err) = error err
throwLeft (Right x) = x

-- Helper function for determining the number of paths from the JSON blob
-- Note that we can't use the types from Swagger2, since the blob is Swagger 3
pathCount :: Value -> Int
pathCount obj = maybe 0 HMS.size (obj ^? key "paths" . _Object)

