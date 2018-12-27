{-# LANGUAGE DataKinds #-}
{-# LANGUAGE Rank2Types #-}

module Translator(translate) where

import BasicPrelude
import Data.Swagger (
    Operation,
    Param,
    ParamAnySchema(..),
    ParamOtherSchema(..),
    ParamSchema(..),
    Schema,
    SwaggerType(..),
    Referenced(..),
    _schemaParamSchema,
    parameters,
    operationId,
    required,
    name,
    type_,
    schema
  )
import Data.Swagger.Internal(SwaggerKind(..))
import Data.Text (unpack)
import Language.Haskell.Exts.Syntax
import Lens.Micro ((^.), (&))
import qualified Prelude as P
import Safe (fromJustNote)

import NoLoc
import ParamType
import PathComponents
import SwaggerM
import TranslationResult


-- Translates an endpoint to its type representation
translate :: EndpointInfo -> SwaggerM TranslationResult
translate (EndpointInfo path method op) = do
  paramInfo   <- deref `mapM` (op ^. parameters)
  queryParams <- queryParam `mapM` paramInfo
  pathParams  <- (pathCompType paramInfo) `mapM` path

  let
    decl = TypeDecl noLoc declHead declBody

    declHead
      = DHead noLoc
      . Ident noLoc
      $ aliasName

    aliasName
      = capitalise
      . unpack
      . fromJustNote ("No id provided for operation at " ++ show (path, method))
      $ op ^. operationId

    declBody
      = foldr (\a b -> TyInfix noLoc a servantPathCompOp b) terminalType
      $ pathParams ++ queryParams

    servantPathCompOp
      = UnpromotedName noLoc
      . UnQual noLoc
      $ Symbol noLoc ":>"

    -- Get '[JSON] GamesResponse
    terminalType = foldl1 (TyApp noLoc) [
        methodType,
        (tyList [requestType]),
        responseType
      ]
    requestType = TyCon noLoc $ unqualName "JSON"

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

  return $ TranslationResult [decl] [aliasName] where

-- Either a simple string or something like:
--    Capture "key" ApiKey
pathCompType :: [Param] -> PathComponent -> SwaggerM (Type NoLoc)
pathCompType _ (PathLiteral s)
  = pure
  . TyPromoted noLoc
  $ PromotedString noLoc (unpack s) (unpack s)
pathCompType params (PathParam s) = do
  let
    expectOne [p] = p
    expectOne ps  = error $ concat [
        "Failed to find unique param ",
        show s,
        " in ",
        show ps
      ]

  tyCon
    <- map paramTypeCon
    .  defaultParamType
    .  expectOne
    .  filter ((== s) . (^. name))
    $  params

  let
    args = [
        TyCon noLoc $ unqualName "Capture",
        TyPromoted noLoc $ PromotedString noLoc (unpack s) (unpack s),
        tyCon
      ]

  return $ foldl1 (TyApp noLoc) args

-- Helper func for creating a type list
-- The undocumented bool on PromotedList/PromotedCon is whether the term is preceded by a single quote
tyList :: [Type NoLoc] -> Type NoLoc
tyList = TyPromoted noLoc . PromotedList noLoc True

-- QueryParam' '[Required] "key" ApiKey
queryParam :: Param -> SwaggerM (Type NoLoc)
queryParam p = do
  paramType <- defaultParamType p

  let
    pName = unpack $ p ^. name
    args = [
        TyCon noLoc $ unqualName "QueryParam'",
        mods,
        TyPromoted noLoc $ PromotedString noLoc pName pName,
        paramTypeCon paramType
      ]
    mods =
      if (fromMaybe False $ p ^. required)
      then tyList [
          TyCon noLoc $ unqualName "Strict",
          TyCon noLoc $ unqualName "Required"
        ]
      else tyList [
          TyCon noLoc $ unqualName "Strict"
        ]

  return $ foldl1 (TyApp noLoc) args

-- Determines the type to use for a param
defaultParamType :: Param -> SwaggerM ParamType
defaultParamType p = paramSchema (match . (^. type_)) (p ^. schema)
  where
    match SwaggerString  = preludeType "Text"
    match SwaggerNumber  = preludeType "Float"
    match SwaggerInteger = preludeType "Int"
    match SwaggerBoolean = preludeType "Boolean"
    match s              = error $ "Unsupported swagger type: " ++ show s ++ "\nin\n" ++ show p

    preludeType = PreludeType . Ident noLoc

-- Helper function for dereferencing schema
-- Unfortunately the different cases are different types of form `ParamSchema _`, to allow certain cases to be constrained to certain contexts.
-- We therefore need to workaround it using a polymorphic function, requiring Rank2Types.
-- Note that Other is the common case, and Body is the uncommon case.
paramSchema :: forall b
            .  (forall a . ParamSchema a -> b)
            -> ParamAnySchema
            -> SwaggerM b
paramSchema f (ParamBody ref) = f . _schemaParamSchema <$> deref ref
paramSchema f (ParamOther s)
  = pure
  . f
  $ _paramOtherSchemaParamSchema s

