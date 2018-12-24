{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE TemplateHaskell #-}

module TranslationResult where

import BasicPrelude
import Data.Char (toLower, toUpper)
import Language.Haskell.Exts.Syntax (
    Decl(TypeDecl)
  )
import Lens.Micro.TH (makeLenses)
import Prelude (Semigroup(..))


-- We don't care about location info
type NoLoc = ()
noLoc :: NoLoc
noLoc = ()

data TranslationResult = TranslationResult {
  _decls :: [Decl NoLoc],
  _endpointNames :: [String]     -- names of types for endpoints
} deriving (Eq, Show)

instance Semigroup TranslationResult where
  (TranslationResult d1 e1) <> (TranslationResult d2 e2) = TranslationResult (d1 <> d2) (e1 <> e2)

instance Monoid TranslationResult where
  mempty = TranslationResult mempty mempty

makeLenses 'TranslationResult


-- Needed to ensure that the type alias always starts with an uppercase character
capitalise :: String -> String
capitalise (x0:xs) = toUpper x0 : xs
capitalise [] = []

unCapitalise :: String -> String
unCapitalise (x0:xs) = toLower x0 : xs
unCapitalise [] = []

