{-# LANGUAGE DeriveFunctor #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module TrelloREST.ClientT where

import TrelloREST.Client

import Control.Monad.Except (ExceptT(..), runExceptT, liftEither)
import Control.Monad.IO.Class (MonadIO(..))
import Control.Monad.Morph (MFunctor(..))
import Control.Monad.Reader (ReaderT(..))
import Control.Monad.Reader (MonadReader(..))
import Control.Monad.Trans.Class (MonadTrans(..))
import Servant.Client (ClientEnv, ServantError, runClientM)


-- | Monad transformer for client calls.
newtype TrelloRESTClientT m a = TrelloRESTClientT {
  unClientT :: (ReaderT ClientEnv) (ExceptT ServantError m) a
} deriving (Functor, Applicative, Monad, MonadIO)

instance MonadTrans TrelloRESTClientT where
  lift ma = TrelloRESTClientT (ReaderT (\_ -> ExceptT (fmap Right ma)))

instance MFunctor SwaggerPetstoreClientT where
  hoist f m = SwaggerPetstoreClientT (ReaderT (\env -> ExceptT (f $ runClientT env m)))

instance MonadIO m => TrelloRESTClientMonad (TrelloRESTClientT m) where
  liftTrelloRESTClient clientM = TrelloRESTClientT $ do
    env <- ask
    res <- liftIO $ runClientM clientM env
    liftEither res

runClientT :: ClientEnv -> TrelloRESTClientT m a -> m (Either ServantError a)
runClientT env =  runExceptT . flip runReaderT env . unClientT

-- | Trivial alias
type TrelloRESTClient = TrelloRESTClientT IO

runClient :: ClientEnv -> TrelloRESTClient a -> IO (Either ServantError a)
runClient = runClientT

