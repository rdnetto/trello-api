module Patches where

import BasicPrelude
import Data.Aeson (Value)
import Lens.Micro((^.), _3)
import Lens.Micro.Aeson (key)

patchSwagger :: Value -> Value
patchSwagger = id

patchDocs :: Value -> Value
patchDocs = id
