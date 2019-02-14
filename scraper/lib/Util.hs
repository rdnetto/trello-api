module Util where

import BasicPrelude
import Data.Either (partitionEithers)


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

