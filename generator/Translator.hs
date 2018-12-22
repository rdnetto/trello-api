{-# LANGUAGE TemplateHaskell #-}

module Translator where

import BasicPrelude
import Language.Haskell.Generate.Monad (Generate)
import Language.Haskell.Generate.TH (declareFunction)
import Servant.API ((:>), Get, JSON, QueryParam', Required)

import PathComponent


declareNamedSymbol ('(:>), "apiAppend")
declareNamedSymbol ('Get, "get")
declareNamedSymbol ('JSON, "json")
declareNamedSymbol ('[JSON], "jsonList")
declareNamedSymbol ('Text, "text")

{-
type SteamAPI =  "IPlayerService"
              :> "GetOwnedGames"
              :> "v0001"
              :> QueryParam' '[Required] "key" ApiKey
              :> QueryParam' '[Required] "steamid" SteamID
              :> QueryParam' '[Required] "include_appinfo" IBool
              :> QueryParam' '[Required] "include_played_free_games" IBool
              :> Get '[JSON] GamesResponse
              -}

emitDecls :: EndpointInfo -> String
emitDecls endpoint = generateModule mod "GeneratedAPI" where
    mod :: ModuleG
        =  do
            addDecl (Ident "TestEndpoint")
                $ expr "IPlayerService" `apiAppend` (get <>$ jsonList <>$ text)

            -- Export everything
            return Nothing

