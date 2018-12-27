module Main where

import BasicPrelude hiding (decodeUtf8)
import qualified Data.ByteString.Lazy as LBS
import qualified Data.Text as T
import Data.Text.Lazy.Encoding (decodeUtf8)
import Network.HTTP.Simple (httpLBS, getResponseBody, getResponseStatusCode)
import Text.HTML.Parser (Attr(..), Token(..), parseTokensLazy)


main :: IO ()
main = do
  -- html <- downloadDocs
  html <- LBS.readFile "reference.html"

  -- Rather than building up a syntax tree, we work directly with the tokens
  -- This has two advantages:
  --  - it works even in the presence of malformed trees (e.g. unclosed tags)
  --  - it is much simpler to stream
  putStrLn "Parsing"
  let tokens
        = parseTokensLazy
        . decodeUtf8
        $ html

  mapM_ handleToken tokens


handleToken :: Token -> IO ()
handleToken (TagOpen name attrs) | (T.toLower name == "script")
  = res where
    attrs' = map (\(Attr k v) -> (k, v)) attrs
    info = do
      tagId <- lookup "id" attrs'
      -- TODO: this is HTML encoded
      json <- lookup "data-json" attrs'
      return $ do
        let len = T.length json
        putStrLn $ "id=" ++ tagId ++ ", data length = " ++ tshow len
        when (len > 100000) $ writeFile ("/tmp/" ++ T.unpack tagId ++ ".bin") json

    res = fromMaybe (pure ()) info

handleToken (TagSelfClose name attrs) = handleToken $ TagOpen name attrs
handleToken _ = pure ()

downloadDocs :: IO LByteString
downloadDocs = do
    putStrLn "Downloading API docs..."
    response <- httpLBS "http://developers.trello.com/reference/"
    let statusCode = getResponseStatusCode response
    when (statusCode /= 200) $ error ("Received status code: " ++ show statusCode)
    return $ getResponseBody response
