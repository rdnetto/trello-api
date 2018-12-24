module Main where

import BasicPrelude
import qualified Data.HashMap.Strict.InsOrd as IOM
import qualified Data.Swagger as Sw
import Data.Swagger (Swagger, PathItem, Operation, paths)
import qualified Data.Text as T
import Data.Tuple (uncurry)
import Data.Yaml (decodeFileThrow)
import Language.Haskell.Exts.Pretty (prettyPrint)
import Lens.Micro ((&), (^.), traversed)
import qualified Prelude as P
import Servant.API (StdMethod(..))

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

  let src = prettyPrint
          . renderModule
          . map translate
          . pure  -- to undo the type change from head
          . head
          $ endpoints
  writeFile "output.hs" $ T.pack src

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

