module Main where

import BasicPrelude hiding (decodeUtf8, encodeUtf8)
import Data.Aeson (Value)
import qualified Data.ByteString.Lazy as BSL
import qualified Data.HashMap.Strict as HMS
import qualified Data.Text as T
import Data.Yaml (encodeFile, decodeFileThrow)
import Lens.Micro((^.), (^?), _3)
import Lens.Micro.Aeson (_Object, key)
import Network.HTTP.Simple (httpLBS, getResponseBody, getResponseStatusCode)
import System.Directory (listDirectory)
import System.Exit (exitFailure)
import System.Process (callProcess)

import Scraper
import SwaggerRewriting


main :: IO ()
main = do
  -- Use cached version of file to improve dev loop
  html <- if False
             then downloadDocs
             else BSL.readFile "/home/reuben/scratch/reference.html"

  rawSwagger <- extractSwagger html
  encodeFile "swagger.yaml" rawSwagger

  -- We need to apply the patches *before* the rewrite & validation stage,
  -- so we can workaround broken-ness in the upstream file
  putStrLn "Applying patches..."
  let patchDir = "scraper/patches/"
  patches <- map (patchDir ++) <$> listDirectory patchDir
  mapM_ applyPatch patches

  patchedSwagger <- decodeFileThrow "swagger.yaml"

  -- Apply the validation / rewrite pass
  case rewriteSwagger patchedSwagger of
       Right obj -> encodeFile "swagger.yaml" obj
       Left  err -> putStrLn err >> exitFailure


extractSwagger :: LByteString -> IO Value
extractSwagger html = do
  putStrLn "Parsing"
  let swaggers = processHtml html

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

-- Applies the specified patch
applyPatch :: FilePath -> IO ()
applyPatch fp = do
  putStrLn $ "Applying " ++ T.pack fp
  callProcess "git" ["apply", "--verbose", fp]
