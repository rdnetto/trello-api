module Translator(translate, renderModule) where

import BasicPrelude
import Data.Swagger (operationId)
import Data.Text (unpack)
import Language.Haskell.Exts.Syntax (
        Decl(TypeDecl),
        DeclHead(DHead),
        MaybePromotedName(UnpromotedName),
        ImportDecl(ImportDecl),
        Module(Module),
        ModuleHead(ModuleHead),
        ModuleName(ModuleName),
        ModulePragma(LanguagePragma),
        Name(..),
        Promoted(..),
        Type(..),
        QName(..)
    )
import Lens.Micro ((^.), (&))
import qualified Prelude as P
import Safe (fromJustNote)

import PathComponents


-- We don't care about location info
type NoLoc = ()
noLoc :: NoLoc
noLoc = ()

-- Translates an endpoint to its type representation
translate :: EndpointInfo -> Decl NoLoc
translate (EndpointInfo path method op) = TypeDecl noLoc declHead declBody where
    declHead = DHead noLoc
             . Ident noLoc
             $ unpack aliasName
    aliasName = op ^. operationId
              & fromJustNote ("No id provided for operation at " ++ show (path, method))
    declBody = foldr (\a b -> TyInfix noLoc a servantPathCompOp b) terminalType
             $ map pathCompType path

    servantPathCompOp = UnpromotedName noLoc
                      . UnQual noLoc
                      $ Symbol noLoc ":>"

    -- Get '[JSON] GamesResponse
    terminalType = (TyApp noLoc) (tyList [methodType]) responseType

    -- TODO: should really be encoding the expected return code here as well, but it doesn't matter because the Swagger spec only uses 200 and 400
    -- Note that we don't use the aliases here (e.g. Get) because they're not defined for all of the verbs
    -- Verb 'GET 200
    methodType = foldl1 (TyApp noLoc) [
            TyCon noLoc (unqualName "Verb"),
            TyPromoted noLoc . PromotedCon noLoc True
                             . unqualName
                             $ show method,
            TyPromoted noLoc $ PromotedInteger noLoc 200 "200"
        ]

    -- TODO: alias this to Data.Aeson.Value
    responseType = TyCon noLoc $ unqualName "UnknownResponseType"

-- Either a simple string or something like:
--      QueryParam' '[Required] "key" ApiKey
pathCompType :: PathComponent -> Type NoLoc
pathCompType (PathLiteral s) = TyPromoted noLoc $ PromotedString noLoc (unpack s) (unpack s)
pathCompType (PathParam s)   = foldl1 (TyApp noLoc) args where
    args = [
            TyCon noLoc $ unqualName "QueryParam'",
            tyList [
                   TyCon noLoc $ unqualName "Strict",
                   -- TODO: check if actually required or not
                   TyCon noLoc $ unqualName "Required"
                ],
            TyPromoted noLoc $ PromotedString noLoc (unpack s) (unpack s),
            -- TODO: support newtypes
            TyCon noLoc $ unqualName "Text"
        ]

unqualName :: String -> QName NoLoc
unqualName = UnQual noLoc . Ident noLoc

-- Helper func for creating a type list
-- The undocumented bool on PromotedList/PromotedCon is whether the term is preceded by a single quote
tyList :: [Type NoLoc] -> Type NoLoc
tyList = TyPromoted noLoc . PromotedList noLoc True

-- Computes the module containing the declarations
renderModule :: [Decl NoLoc] -> Module NoLoc
renderModule = Module noLoc (Just modHead) pragmas imports where
    modHead = ModuleHead noLoc (ModuleName noLoc "API") Nothing Nothing
    pragmas = [
            -- Needed for promoting values to types
            LanguagePragma noLoc [Ident noLoc "DataKinds"]
        ]
    imports = [
            simpleImport "Prelude",
            simpleImport "Servant.API"
        ]

    simpleImport s = ImportDecl
                        noLoc
                        (ModuleName noLoc s)
                        False       -- qualified?
                        False
                        False
                        Nothing
                        Nothing
                        Nothing     -- import spec

