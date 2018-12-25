module Main where

import BasicPrelude
import qualified Data.HashMap.Strict.InsOrd as IOM
import qualified Data.Swagger as Sw
import Data.Swagger (Swagger, PathItem, Operation, paths)
import Data.Tuple (uncurry)
import Data.Yaml (decodeFileThrow)
import Lens.Micro ((&), (^.), traversed)
import Servant.API (StdMethod(..))

import ModuleRenderer
import PathComponents
import Translator


main :: IO ()
main = do
  swagger :: Swagger
          <- decodeFileThrow "openapi-directory/APIs/trello.com/1.0/swagger.yaml"
  -- TODO translate swagger entries to types
  let endpoints = swagger
        ^. paths
        & IOM.toList
        & map (uncurry parsePaths)
        & join

  let tr = concat
          . map translate
          $ endpoints

  writeModule "out/API.hs"    $ apiModule    "trello" "Trello" tr
  writeModule "out/Client.hs" $ clientModule "trello" "Trello" tr

parsePaths :: FilePath -> PathItem -> [EndpointInfo]
parsePaths fp pi = uncurry (EndpointInfo $ parsePath fp) <$> pathOps pi

-- Extracts all the operations from a PathItem
pathOps :: PathItem -> [(StdMethod, Operation)]
pathOps pi = res where
    res = catMaybes [
            (GET, )     <$> pi ^. Sw.get,
            (POST, )    <$> pi ^. Sw.post,
            (HEAD, )    <$> pi ^. Sw.head_,
            (PUT, )     <$> pi ^. Sw.put,
            (DELETE, )  <$> pi ^. Sw.delete,
            (OPTIONS, ) <$> pi ^. Sw.options,
            (PATCH, )   <$> pi ^. Sw.patch
        ]

