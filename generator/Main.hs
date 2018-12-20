module Main where

import BasicPrelude
import Data.Aeson (eitherDecodeFileStrict)
import Data.Swagger (Swagger)


main :: IO ()
main = do
  swagger :: Swagger
          <- throwLeft <$> eitherDecodeFileStrict "swagger.json"
  print swagger

throwLeft :: Either String a -> a
throwLeft (Left msg) = error msg
throwLeft (Right x)  = x

