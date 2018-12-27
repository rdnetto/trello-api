module HtmlDecoding (htmlDecode) where

import BasicPrelude hiding (takeWhile)
import Control.Applicative (many)
import Data.Attoparsec.Text (Parser, anyChar, notChar, endOfInput, parseOnly, takeWhile)
import qualified Data.Text as T
import HTMLEntities.Parser (htmlEntity)


-- Decode HTML entities in the string
htmlDecode :: Text -> Text
htmlDecode s = res where
  res = case parseOnly parser s of
           Right x -> x
           Left  m -> error m

parser :: Parser Text
parser = concat <$> res where
  -- htmlEntity matches a token like "&#169;", so we need a second parse term to match everything else
  nonEntity = T.cons <$> anyChar <*> takeWhile (/= '&')
  res = many (htmlEntity <|> nonEntity) <* endOfInput

