{-# LANGUAGE StrictData #-}

module ParamType where

import BasicPrelude
import Language.Haskell.Exts.Syntax (
    Decl,
    ImportDecl(..),
    ImportSpec(..),
    ImportSpecList(..),
    ModuleName(..),
    QName(..),
    Name(..),
    Type(..),
  )

import NoLoc


-- The type used for a parameter / response
data ParamType
  = PreludeType (Name NoLoc)                        -- ^ a type provided by Prelude (or Text), which doesn't require an import.
  | ImportedType (ModuleName NoLoc) (Name NoLoc)    -- ^ a type that needs to be import. Consists of the module, and the type name itself.
  | NewType (Decl NoLoc) (Name NoLoc)               -- ^ a generated type that needs to be defined. Consists of the declaration of the type, and its name.
  deriving (Eq, Show)

-- Gets the type constructor to use
paramTypeCon :: ParamType -> Type NoLoc
paramTypeCon (PreludeType n)    = TyCon noLoc $ UnQual noLoc n
paramTypeCon (ImportedType _ n) = TyCon noLoc $ UnQual noLoc n
paramTypeCon (NewType _ n)      = TyCon noLoc $ UnQual noLoc n

-- The import declaration needed (if any)
paramTypeImport :: ParamType -> Maybe (ImportDecl NoLoc)
paramTypeImport (ImportedType mod n) = Just $ ImportDecl
    noLoc
    mod
    False
    False
    False
    Nothing
    Nothing
    (Just $ ImportSpecList noLoc False [IVar noLoc n])
paramTypeImport _ = Nothing

-- The type declaration needed, if any
paramTypeDecl :: ParamType -> Maybe (Decl NoLoc)
paramTypeDecl (NewType d _) = Just d
paramTypeDecl _ = Nothing


