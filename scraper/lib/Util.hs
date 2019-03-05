module Util where

import BasicPrelude
import qualified Data.HashMap.Strict as HMS
import Data.Aeson (ToJSON, Value(Object))
import qualified Data.ByteString as BS
import Data.Either (partitionEithers)
import Data.Function ((&))
import Data.Yaml.Pretty (encodePretty, defConfig, setConfCompare)
import Lens.Micro((^..))
import Lens.Micro.Aeson (_String, key)


-- b for the empty case, or any for non-empty case
anyOr :: Bool -> [Bool] -> Bool
anyOr b [] = b
anyOr _ xs = any id xs

-- Like sequence, but preserves all left-values
-- Useful for batch reporting of errors.
batchEithers :: [Either a b] -> Either [a] [b]
batchEithers xs = res where
  (lefts, rights) = partitionEithers xs
  res | null lefts = Right rights
      | otherwise  = Left lefts

fromRightNote :: String -> Either String a -> a
fromRightNote msg (Left err) = error (msg ++ ": " ++ err)
fromRightNote _ (Right x) = x

-- Like encodeFile, but sorts keys first
encodeFilePretty :: ToJSON a => FilePath -> a -> IO ()
encodeFilePretty fp
    = BS.writeFile fp
    . encodePretty cfg
  where
    cfg = defConfig
        & setConfCompare compare

-- Convenience function for creating objects
mkObject :: [(Text, Value)] -> Value
mkObject = Object . HMS.fromList

-- Convenience function for creating objects
mkSimpleObject :: Text -> Value -> Value
mkSimpleObject k v = mkObject [(k, v)]
--
-- Generic helper for extracting a string from a JSON object
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

