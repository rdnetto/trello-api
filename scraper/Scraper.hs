{-# LANGUAGE TypeApplications #-}

module Scraper (processHtml) where

import BasicPrelude hiding (decodeUtf8, encodeUtf8)
import Data.Aeson (Value, eitherDecode')
import qualified Data.Map.Lazy as DML
import qualified Data.Text as T
import qualified Data.Text.Lazy as TL
import Data.Text.Lazy.Encoding (decodeUtf8, encodeUtf8)
import Text.HTML.Parser (Attr(..), Token(..), parseTokensLazy)

import HtmlDecoding


-- Rather than building up a syntax tree, we work directly with the tokens
-- This has two advantages:
--  - it works even in the presence of malformed trees (e.g. unclosed tags)
--  - it is much simpler to stream

-- Extracts from the HTML a list of (uid, swagger) tuples
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

