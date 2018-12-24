module Translator(translate) where

import BasicPrelude
import Data.Swagger (operationId)
import Data.Text (unpack)
import Language.Haskell.Exts.Syntax
import Lens.Micro ((^.))
import qualified Prelude as P
import Safe (fromJustNote)

import PathComponents
import TranslationResult


-- Translates an endpoint to its type representation
translate :: EndpointInfo -> TranslationResult
translate (EndpointInfo path method op) = TranslationResult [decl] [aliasName] where
    decl = TypeDecl noLoc declHead declBody
    declHead = DHead noLoc
             . Ident noLoc
             $ aliasName
    aliasName = capitalise
              . unpack
              . fromJustNote ("No id provided for operation at " ++ show (path, method))
              $ op ^. operationId
    declBody = foldr (\a b -> TyInfix noLoc a servantPathCompOp b) terminalType
             $ map pathCompType path

    servantPathCompOp = UnpromotedName noLoc
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

-- Helper func for creating a type list
-- The undocumented bool on PromotedList/PromotedCon is whether the term is preceded by a single quote
tyList :: [Type NoLoc] -> Type NoLoc
tyList = TyPromoted noLoc . PromotedList noLoc True
