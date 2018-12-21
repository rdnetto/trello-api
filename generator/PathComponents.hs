module PathComponents (EndpointInfo(..), PathComponent(..), parsePath) where

import Data.Swagger (Operation)
import Data.Text (Text, pack, isPrefixOf, isSuffixOf)
import Prelude
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


parsePath :: FilePath -> [PathComponent]
parsePath fp = parseComp . pack <$> splitPath fp

parseComp :: Text -> PathComponent
parseComp s
  | "{" `isPrefixOf` s && "}" `isSuffixOf` s = PathParam   s
  | otherwise                                = PathLiteral s

