{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE Rank2Types #-}

module SwaggerM(SwaggerM, Referenceable(..)) where

import BasicPrelude
import Control.Monad.Reader (Reader, ask)
import qualified Data.HashMap.Strict.InsOrd as IOM
import Data.Swagger (
    Definitions,
    Param,
    Referenced(..),
    Reference(..),
    Schema,
    Swagger,
    definitions,
    parameters
  )
import Data.Text (unpack)
import Lens.Micro (Lens')
import Lens.Micro ((^.))
import Safe(fromJustNote)


-- Ensure the entire swagger structure is available.
type SwaggerM = Reader Swagger

-- Dereference a (possibly) referenced structure
class Referenceable a where
  deref :: Referenced a -> SwaggerM a

instance Referenceable Schema where
  deref = resolve definitions

instance Referenceable Param where
  deref = resolve parameters


-- Internal helper function
resolve :: Lens' Swagger (Definitions a)
        -> (Referenced a -> SwaggerM a)
resolve _    (Inline x)          = pure x
resolve lens (Ref (Reference r)) = f <$> ask where
  f = fromJustNote ("Failed to resolve ref: " ++ unpack r)
    . (IOM.lookup r)
    . (^. lens)

