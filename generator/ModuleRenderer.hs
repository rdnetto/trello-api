module ModuleRenderer(apiModule, clientModule, writeModule) where

import BasicPrelude
import Data.Char (toUpper)
import Data.Text (unpack)
import qualified Data.Text as T
import Language.Haskell.Exts.Pretty (Style(..), PPHsMode(..), defaultMode, style, prettyPrintStyleMode)
import Language.Haskell.Exts.Syntax
import Lens.Micro ((^.))

import TranslationResult


-- Computes module containing the Servant API types.
-- shortName should be camelcase
-- modName is the name of the package that will contain the module
apiModule :: String -> String -> TranslationResult -> Module NoLoc
apiModule shortName modName tr = Module noLoc (Just modHead) pragmas imports decls' where
  modHead = ModuleHead noLoc (ModuleName noLoc $ modName ++ ".API") Nothing Nothing
  pragmas = [
      -- Default stack depth for type simplification is 200, which is easily overflowed by the generated monstrosity
      OptionsPragma noLoc (Just GHC) "-freduction-depth=0",
      -- Needed for promoting values to types
      LanguagePragma noLoc [Ident noLoc "DataKinds"],
      LanguagePragma noLoc [Ident noLoc "TypeOperators"]
    ]
  imports = [
      -- Included for users using NoImplicitPrelude
      simpleImport "Prelude",
      simpleImport "Servant.API",
      simpleImport "Data.Proxy",
      scopedImport "Data.Text" ["Text"]
    ]

  -- e.g. usage for defining server API, or just a more flexible client typeclass impl
  decls' = (tr ^. decls) ++ [
      unknownResponseType,    -- TODO: replace this with a general newtype mechanism
      apiType,
      apiProxySig,
      apiProxy
    ]

  -- type UnknownResponseType = Text
  unknownResponseType = TypeDecl noLoc
    (DHead noLoc $ Ident noLoc "UnknownResponseType")
    (TyCon noLoc $ unqualName "Text")

  -- type FooAPI = T0 :<|> T1 :<|> T2 ...
  apiType = TypeDecl noLoc
    (DHead noLoc $ Ident noLoc apiTypeName)
    (foldr1 (\a b -> TyInfix noLoc a unionAPI b)
      . map (TyCon noLoc . unqualName)
      $ (tr ^. endpointNames)
    )

  unionAPI =
    UnpromotedName noLoc
    . UnQual noLoc
    $ Symbol noLoc ":<|>"

  -- fooAPI :: Proxy FooAPI
  apiName = shortName ++ "API"
  apiTypeName = capitalise shortName ++ "API"
  apiProxySig = TypeSig noLoc
    [Ident noLoc apiName]
    (TyApp noLoc
      (TyCon noLoc $ unqualName "Proxy")
      (TyCon noLoc $ unqualName apiTypeName)
    )

  -- fooAPI = Proxy
  apiProxy = PatBind noLoc
   (PVar noLoc (Ident noLoc apiName))
   (UnGuardedRhs noLoc . Con noLoc $ unqualName "Proxy")
   Nothing

-- Computes module containing the Servant client definition.
-- shortName should be camelcase
-- modName is the name of the package that will contain the module
clientModule :: String -> String -> TranslationResult -> Module NoLoc
clientModule shortName modName tr = Module noLoc (Just modHead) [] imports decls' where
  modHead = ModuleHead noLoc (ModuleName noLoc $ modName ++ ".Client") Nothing Nothing
  imports = [
      -- Included for users using NoImplicitPrelude
      simpleImport "Prelude",
      simpleImport "Servant.API",
      simpleImport "Servant.Client",
      simpleImport (modName ++ ".API")
    ]

  decls' = [monadClass shortName, apiDefn]

  -- t0 :<|> t1 :<|> t2 ... = hoistClient fooAPI liftFooClient (client fooAPI)
  apiDefn = PatBind noLoc apiLHS apiRHS Nothing
  apiLHS = foldr1 (\a b -> PInfixApp noLoc a unionAPIOp b)
    . map (PVar noLoc . Ident noLoc)
    . map unCapitalise
    $ (tr ^. endpointNames)
  unionAPIOp = UnQual noLoc $ Symbol noLoc ":<|>"
  apiRHS = UnGuardedRhs noLoc $ foldl1 (App noLoc) [
      (Var noLoc $ unqualName "hoistClient"),
      (Var noLoc $ unqualName apiName),
      (Var noLoc $ unqualName methodName),
      (App noLoc
        (Var noLoc $ unqualName "client")
        (Var noLoc $ unqualName apiName)
      )
    ]
  apiName = shortName ++ "API"
  methodName = "lift" ++ capitalise shortName ++ "Client"

-- Custom type class to allow any transformer stack to use this API. i.e.
--    class Monad m => FooMonad m where
--      liftFooClient :: ClientM a -> m a
monadClass :: String -> Decl NoLoc
monadClass name = ClassDecl noLoc (Just ctx) declHead [] (Just [liftFooClient])  where
  m = Ident noLoc "m"
  a = Ident noLoc "a"
  monadClassName = capitalise name ++ "Class"
  methodName = "lift" ++ capitalise name ++ "Client"

  ctx =
    CxSingle noLoc $ ClassA
      noLoc
      (unqualName "Monad")
      [TyVar noLoc m]

  declHead =
    DHApp noLoc
      (DHead noLoc $ Ident noLoc monadClassName)
      (UnkindedVar noLoc m)

  liftFooClient =
    ClsDecl noLoc $ TypeSig noLoc
      [Ident noLoc methodName]
      (TyFun noLoc
        (TyApp noLoc
          (TyVar noLoc $ Ident noLoc "ClientM")
          (TyVar noLoc a)
        )
        (TyApp noLoc
          (TyVar noLoc m)
          (TyVar noLoc a)
        )
      )

simpleImport :: String -> ImportDecl NoLoc
simpleImport s = ImportDecl
  noLoc
  (ModuleName noLoc s)
  False       -- qualified?
  False
  False
  Nothing
  Nothing
  Nothing     -- import spec

scopedImport :: String -> [String] -> ImportDecl NoLoc
scopedImport mod symbols = ImportDecl
    noLoc
    (ModuleName noLoc mod)
    False       -- qualified?
    False
    False
    Nothing
    Nothing
    (Just . ImportSpecList noLoc False $ map spec symbols)
  where
    spec = IVar noLoc . Ident noLoc

-- Helper method for serialising and writing out module
writeModule :: MonadIO m => FilePath -> Module l -> m ()
writeModule fp = liftIO . writeFile fp . T.pack . prettyPrintStyleMode style' mod where
  style' = style {ribbonsPerLine = 0.1}
  mod = defaultMode {onsideIndent = 0}

