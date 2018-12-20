module Main where

import BasicPrelude
import Data.Swagger (Swagger)
import Data.Yaml (decodeFileThrow)


main :: IO ()
main = do
  swagger :: Swagger
          <- decodeFileThrow "openapi-directory/APIs/trello.com/1.0/swagger.yaml"
  print swagger

