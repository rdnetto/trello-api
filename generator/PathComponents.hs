module PathComponents (EndpointInfo(..), PathComponent(..), parsePath) where

import BasicPrelude
import Data.Swagger (Operation)
import qualified Data.Text as T
import Servant.API (StdMethod(..))
import System.FilePath.Posix (splitPath)


-- A component in a path such as "/actions/{idAction}"
data PathComponent
    = PathLiteral Text
    | PathParam Text
    deriving (Eq, Show)

-- The information needed to emit a single endpoint type
data EndpointInfo = EndpointInfo {
  endpointPath    :: [PathComponent],
  endpointMethod  :: StdMethod,
  endpointDetails :: Operation
} deriving (Eq, Show)


-- Extracts the components from a path
parsePath :: FilePath -> [PathComponent]
parsePath =
  map parseComp
  . filter (not . T.null)
  . map (T.dropWhileEnd (== '/'))           -- Needed because splitPath doesn't remove the trailing slash
  . map T.pack
  . splitPath

parseComp :: Text -> PathComponent
parseComp s
  | "{" `T.isPrefixOf` s && "}" `T.isSuffixOf` s = PathParam   s
  | otherwise                                = PathLiteral s

