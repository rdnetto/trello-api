module TrelloREST.Env (trelloEnv) where

import Control.Monad.IO.Class (MonadIO(..))
import Network.HTTP.Client (ManagerSettings(..), Request, queryString)
import Data.Text (Text)
import Data.Text.Encoding (encodeUtf8)
import Network.HTTP.Types.URI (parseQuery, renderQuery)
import Data.Function ((&))
import Control.Monad ((<=<))
import Network.HTTP.Client.TLS (newTlsManagerWith, tlsManagerSettings)
import Prelude
import Servant.Client (ClientEnv, mkClientEnv)

import TrelloREST.ClientT (baseUrl)

-- Creates an enviroment suitable for executing requests from TrelloRESTClientT
-- See https://developers.trello.com/reference/#api-key-tokens for more info.
trelloEnv :: MonadIO m
  => Text           -- | ^ API key
  -> Text           -- | ^ auth token
  -> m ClientEnv
trelloEnv apiKey authToken
  = flip mkClientEnv baseUrl <$> newTlsManagerWith settings
  where
    settings
      = tlsManagerSettings
      & addModifyRequest (authInfoAppender apiKey authToken)

-- Apply the provided function after any pre-existing functions
addModifyRequest :: (Request -> IO Request) -> ManagerSettings -> ManagerSettings
addModifyRequest f set = set { managerModifyRequest = f' } where
  f' = f <=< managerModifyRequest set

-- Adds the query params for the auth info to all requests.
authInfoAppender :: Text -> Text -> Request -> IO Request
authInfoAppender apiKey authToken req = pure $ req { queryString = f (queryString  req) } where
  f = renderQuery True
    . paramAppender "key" apiKey
    . paramAppender "token" authToken
    . parseQuery

  paramAppender k v = (:) (k, Just (encodeUtf8 v))

