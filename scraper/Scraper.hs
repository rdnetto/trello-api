{-# LANGUAGE TypeApplications #-}

module Scraper (getJsonBlobs, extractSwaggers) where

import BasicPrelude hiding (decodeUtf8, encodeUtf8)
import Data.Aeson (Value(Object), eitherDecode')
import qualified Data.HashMap.Strict as HMS
import qualified Data.Text as T
import qualified Data.Text.Lazy as TL
import Data.Text.Lazy.Encoding (decodeUtf8, encodeUtf8)
import Safe (fromJustNote)
import Text.HTML.Parser (Attr(..), Token(..), parseTokensLazy)

import HtmlDecoding


{-
  The following (non-trivial) JSON blobs can be found:
  appearance      - styling info
  docs            - definitions of objects, human readable docs
  flags           - misc flags
  hub-me          - some kind of auth token
  modules         - enables various aspects of the doc viewer
  oasFiles        - map containing swagger docs. Only one of them actually has paths populated.
                    Seems intended for use with beta endpoints.
-}

{-
  Rather than building up a syntax tree, we work directly with the tokens
  This has several advantages:
  - it works even in the presence of malformed trees (e.g. unclosed tags)
  - it is much simpler to stream
  - it reduces the amount of memory required
-}

-- Low-level for the getting the (id, JSON) tuples from the raw HTML
getJsonBlobs :: LByteString -> [(Text, Value)]
getJsonBlobs
  = map parseBlob
  -- Extract the JSON blobs
  . catMaybes
  . map handleToken
  -- Extract tags from HTML
  . parseTokensLazy
  . decodeUtf8

-- Extracts a list of (uid, swagger) tuples from the (id, JSON) entries returned by getJsonBlobs
extractSwaggers :: [(Text, Value)] -> [(Text, Value)]
extractSwaggers
  = HMS.toList
  . unObject
  . fromJustNote "Could not find oasFiles in JSON blobs"
  . lookup "oasFiles"
  where
    unObject (Object obj) = obj
    unObject x = error $ "Not an object: " ++ show x

parseBlob :: (Text, Text) -> (Text, Value)
parseBlob (key, blob) = (key, res) where
  res
    = fromLeftNote ("Error parsing entry for " ++ T.unpack key)
    . eitherDecode'
    . encodeUtf8
    . TL.fromStrict
    . htmlDecode
    $ blob

-- Matches `<script id="oasFiles" data-json="..." />` and returns (id, json)
handleToken :: Token -> Maybe (Text, Text)
handleToken (TagOpen name attrs) = do
  guard $ T.toLower name == "script"
  let attrs' = map (\(Attr k v) -> (k, v)) attrs
  contentType <- lookup "type" attrs'
  guard $ contentType == "application/json"
  (,) <$> lookup "id" attrs'
      <*> lookup "data-json" attrs'
handleToken (TagSelfClose name attrs) = handleToken $ TagOpen name attrs
handleToken _ = Nothing

fromLeftNote :: String -> Either String a -> a
fromLeftNote msg (Left err) = error (msg ++ ": " ++ err)
fromLeftNote _ (Right x) = x

