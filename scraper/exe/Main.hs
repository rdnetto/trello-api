module Main where

import BasicPrelude hiding (decodeUtf8, encodeUtf8)
import Data.Aeson (Value)
import qualified Data.ByteString.Lazy as BSL
import qualified Data.HashMap.Strict as HMS
import Lens.Micro((^.), (^?), _3)
import Lens.Micro.Aeson (_Object, key)
import Network.HTTP.Simple (httpLBS, getResponseBody, getResponseStatusCode)
import System.Exit (exitFailure)

import DocParsing
import Patches
import SchemaInference
import Scraper
import SwaggerRewriting
import Util


main :: IO ()
main = do
  -- Use cached version of file to improve dev loop
  html <- if False
             then downloadDocs
             else BSL.readFile "/home/reuben/scratch/reference.html"

  -- Parse and patch the swagger file and docs
  -- We save the pre-patched versions to simplify patch writing
  let jsonBlobs
        = getJsonBlobs html

  rawSwagger <- getSwagger $ extractSwaggers jsonBlobs
  patchedSwagger
    <-  andAlso (encodeFilePretty "swagger.yaml.patched")
    <=< map patchSwagger
    .   andAlso (encodeFilePretty "swagger.yaml.raw")
    $   rawSwagger

  docs
    <-  andAlso (encodeFilePretty "docs.yaml.patched")
    <=< map patchDocs
    .   andAlso (encodeFilePretty "docs.yaml.raw")
    $   extractDocs jsonBlobs

  let responseSchemas
        = HMS.map inferSchema
        . extractExampleResponses
        $ docs

  putStrLn $ tshow (HMS.size responseSchemas) ++ " schemas inferred"

  -- Apply the validation / rewrite pass
  case rewriteSwagger responseSchemas patchedSwagger of
       Right obj -> encodeFilePretty "swagger.yaml" obj
       Left  err -> putStrLn err >> exitFailure

-- Selects the appropriate swagger entry
getSwagger :: [(Text, Value)] -> IO Value
getSwagger swaggers = do
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
  return selected

-- Downloads the API docs
downloadDocs :: IO LByteString
downloadDocs = do
    putStrLn "Downloading API docs..."
    response <- httpLBS "http://developers.trello.com/reference/"
    let statusCode = getResponseStatusCode response
    when (statusCode /= 200) $ error ("Received status code: " ++ show statusCode)
    return $ getResponseBody response

-- Helper function for determining the number of paths from the JSON blob
-- Note that we can't use the types from Swagger2, since the blob is Swagger 3
pathCount :: Value -> Int
pathCount obj = maybe 0 HMS.size (obj ^? key "paths" . _Object)

-- Perform an action, but discard its result and return the original value
andAlso :: Applicative f => (a -> f ()) -> a -> f a
andAlso f x = f x *> pure x

