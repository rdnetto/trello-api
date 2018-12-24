module ModuleRenderer(renderModule) where

import BasicPrelude
import Data.Char (toUpper)
import Data.Text (unpack)
import Language.Haskell.Exts.Syntax (
        ImportDecl(ImportDecl),
        Module(Module),
        ModuleHead(ModuleHead),
        ModuleName(ModuleName),
        ModulePragma(LanguagePragma),
        Name(..),
        QName(..)
    )
import Lens.Micro ((^.))

import TranslationResult


-- Computes the module containing the declarations
renderModule :: String -> TranslationResult -> Module NoLoc
renderModule apiName tr = Module noLoc (Just modHead) pragmas imports decls' where
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

    decls' = (tr ^. decls) ++ [monadClass, apiType, apiProxy, apiDefn]

    -- custom type class to allow any transformer stack to use this API
    monadClass = undefined
    -- type FooAPI = T0 :<|> T1 :<|> T2 ...
    apiType = undefined
    -- fooAPI = Proxy :: Proxy FooAPI
    apiProxy = undefined
    -- t0 :<|> t1 :<|> t2 ... = hoistClient fooAPI liftFooClient (client fooAPI)
    apiDefn = undefined
