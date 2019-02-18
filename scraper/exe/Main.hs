module Main where

import BasicPrelude hiding (decodeUtf8, encodeUtf8)
import Control.Exception (evaluate)
import Data.Aeson (Value)
import qualified Data.ByteString.Lazy as BSL
import qualified Data.HashMap.Strict as HMS
import qualified Data.List as L
import qualified Data.Text as T
import Data.Yaml (encodeFile, decodeFileThrow)
import Lens.Micro((^.), (^?), _3)
import Lens.Micro.Aeson (_Object, key)
import Network.HTTP.Simple (httpLBS, getResponseBody, getResponseStatusCode)
import System.Directory (listDirectory)
import System.Exit (exitFailure)
import System.Process (callProcess)

import DocParsing
import Scraper
import SwaggerRewriting


main :: IO ()
main = do
  -- Use cached version of file to improve dev loop
  html <- if False
             then downloadDocs
             else BSL.readFile "/home/reuben/scratch/reference.html"

  -- Parse and patch the swagger file and docs
  let jsonBlobs
        = getJsonBlobs html

  patchedSwagger
    <-  applyPatches "swagger"
    =<< (getSwagger $ extractSwaggers jsonBlobs)

  docs
    <- applyPatches "docs"
    $  extractDocs jsonBlobs

  -- Compute the schema for responses from docs (not present in swagger)
  let responseSchemas
        = HMS.map inferSchema
        . extractExampleResponses
        $ docs

  -- DEBUG: Forcing thunk for debugging
  void $ evaluate responseSchemas

  -- Apply the validation / rewrite pass
  -- TODO: this should consume responseSchemas
  case rewriteSwagger patchedSwagger of
       Right obj -> encodeFile "swagger.yaml" obj
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

-- General mechanism for patching files which are well-formed JSON, but broken in subtle ways.
-- `name` is both the filename (minus extension) and the name of the patch directory
applyPatches :: FilePath -> Value -> IO Value
applyPatches name input = do
  -- We intentionally write the patched file to the root dir instead of /tmp,
  -- since this simplifies debugging and patch creation.
  encodeFile (name ++ ".yaml") input

  -- We need to apply the patches *before* the rewrite & validation stage,
  -- so we can workaround broken-ness in the upstream file
  putStrLn $ "Applying patches for " ++ T.pack name ++ "..."
  let patchDir = "scraper/patches/" </> name

  patches
    <-  map (patchDir </>)
    .   filter (L.isSuffixOf ".patch")
    <$> listDirectory patchDir

  mapM_ applyPatch patches
  decodeFileThrow $ name ++ ".yaml"

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

-- Applies the specified patch
applyPatch :: FilePath -> IO ()
applyPatch fp = do
  putStrLn $ "Applying " ++ T.pack fp
  callProcess "git" ["apply", "--verbose", fp]
