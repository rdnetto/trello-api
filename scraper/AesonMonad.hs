{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE UndecidableInstances #-}

module AesonMonad (
    AesonMonad(..),
    AesonT,
    AesonM,
    runAesonT,
    runAeson,
    forEachKey,
    forEachKey_,
    forEachValue,
    forEachValue_,
    mapCurrent,
    mapFilterChildren,
    withChild,
  ) where

import BasicPrelude
import Control.Monad.Except (MonadError, Except, runExcept, throwError)
import Control.Monad.State.Lazy (StateT, runStateT)
import Data.Aeson (Value(Object))
import qualified Data.HashMap.Strict as HMS
import qualified Data.Text as T
import Lens.Micro ((^.))
import Lens.Micro.Aeson (key)
import Lens.Micro.Mtl ((%=), (.=), preuse, use)
import Lens.Micro.TH (makeLenses)


-- A stateful monad for navigating & transforming deeply nested JSON objects.
class Monad m => AesonMonad m where
  -- Step into the given object.
  -- Prefer using withChild to enterChild/exitChild.
  enterChild :: Text -> m ()

  -- Step out of a object entered with enterChild.
  -- Prefer using withChild to enterChild/exitChild.
  exitChild :: m ()

  -- Retrieve the current location in the object. Returns an empty list for the root.
  getPath :: m [Text]

  -- Retrieves the current sub-object
  getCurrent :: m Value

  -- Replaces the current sub-object
  setCurrent :: Value -> m ()

-- Used to track state
data AesonState = AesonState {
  -- | The current path in the object.
  -- TODO: use a type with O(1) append
  _path :: [Text],
  -- | The root object
  _root :: Value,
  -- | The current sub-object
  _current :: Value
} deriving (Eq, Show)

makeLenses ''AesonState

-- Aeson monad transformer
newtype AesonT m a = AesonT (StateT AesonState m a)
  deriving (Functor, Applicative, Monad, MonadError e)

type AesonM = AesonT (Except Text)

-- Runs the monad against the specified Aeson object.
runAesonT :: MonadError Text m => AesonT m a -> Value -> m (a, Value)
runAesonT (AesonT action) obj = do
  let initialState = AesonState [] obj obj
  (res, state) <- runStateT action initialState
  return (res, state ^. root)

-- Runs the monad against the specified Aeson object, using ExceptT for error handling.
runAeson :: AesonM a -> Value -> Either Text (a, Value)
runAeson action = runExcept . runAesonT action


instance MonadError Text m => AesonMonad (AesonT m) where
  enterChild k = do
    AesonT $ path %= (++ [k])
    updateCurrent

  exitChild = do
    AesonT $ path %= init
    updateCurrent

  getPath = AesonT $ use path
  getCurrent = AesonT $ use current

  setCurrent newVal = do
    lens <- currentLens
    AesonT $ do
      lens .= newVal
      current .= newVal

-- Internal method for updating current
updateCurrent :: MonadError Text m => AesonT m ()
updateCurrent = do
  lens <- currentLens
  newVal <- AesonT $ preuse lens
  case newVal of
       Just val -> AesonT $ current .= val
       Nothing  -> do
         newPath <- getPath
         throwError $ "Could not locate " ++ T.intercalate "." newPath

-- Gets a traversal to the current object via the root object.
--
-- Note that I needed to lift the type parameter f (from within the definition of Traversal)
-- into the function signature to workaround GHC's lack of support for impredicative types.
currentLens :: (Monad m, AesonMonad m, Applicative f)
  -- m (Traversal' AesonState Value)
  => m (
    (Value -> f Value)
    -> AesonState
    -> f AesonState
  )
currentLens = do
  path <- getPath
  let pathLens = foldr (.) id (map key path)
  return $ root . pathLens

-- Runs an action in the context of a sub-object identified by the specified key.
withChild :: AesonMonad m => Text -> m a -> m a
withChild k f = enterChild k *> f <* exitChild

-- For each key in the current object, apply the provided function in the context of that sub-object.
-- TODO: this family of functions only supports traversing through objects, not arrays
forEachKey :: AesonMonad m => (Text -> m b) -> m [b]
forEachKey action = do
    current <- getCurrent
    forM
      (keys current)
      (\k -> withChild k (action k))
  where
    keys (Object obj) = HMS.keys obj
    keys _ = []

-- For each key in the current object, apply the provided function in the context of that sub-object,
-- discarding the result.
forEachKey_ :: AesonMonad m => (Text -> m ()) -> m ()
forEachKey_ = void . forEachKey

-- Executes the provided action in the context of each sub-object.
forEachValue :: AesonMonad m => m a -> m [a]
forEachValue = forEachKey . const

-- Executes the provided action in the context of each sub-object.
forEachValue_ :: AesonMonad m => m () -> m ()
forEachValue_ = forEachKey_ . const

-- Apply the specified transformation to each sub-object.
mapFilterChildren :: AesonMonad m => (Value -> Maybe Value) -> m ()
mapFilterChildren f = mapCurrent transform where
  transform (Object obj) = Object $ HMS.mapMaybe f obj
  transform x = x

-- Applies the provided transformation to the current object.
mapCurrent :: AesonMonad m => (Value -> Value) -> m ()
mapCurrent f = setCurrent =<< f <$> getCurrent

