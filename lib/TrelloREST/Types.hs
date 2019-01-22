{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# OPTIONS_GHC -fno-warn-unused-binds -fno-warn-unused-imports -fno-warn-orphans #-}

module TrelloREST.Types (
  Body (..),
  Body_1 (..),
  Body_2 (..),
  Body_3 (..),
  CFValue (..),
  Value_ (..),
  ) where

import Data.Aeson (Value, FromJSON(..), ToJSON(..), genericToJSON, genericParseJSON)
import Data.Aeson.Types (Options(..), defaultOptions)
import Data.Function ((&), on)
import Data.List (stripPrefix)
import qualified Data.Map as Map
import Data.Maybe (fromMaybe)
import qualified Data.Text as T
import Data.Time.LocalTime (ZonedTime, zonedTimeToUTC)
import GHC.Generics (Generic)
import Prelude

import Data.ByteString (ByteString)
import Data.Text (Text)
import Data.Time.Calendar (Day)


-- Orphan instance - needed so we can derive Eq instances for our data types
instance Eq ZonedTime where
    (==) = (==) `on` zonedTimeToUTC



-- | 
data Body = Body
  { bodyModelType :: Text -- ^ The type of model that the Custom Field is being defined on. This should always be `board`.
  , bodyDisplay'UnderscorecardFront :: Bool -- ^ Whether this custom field should be shown on the front of cards
  , bodyPos :: Text -- ^ 
  , bodyName :: Text -- ^ 
  , bodyIdModel :: Text -- ^ The ID of the model for which the Custom Field is being defined. This should always be the ID of a board.
  , bodyOptions :: Text -- ^ 
  , bodyType :: Text -- ^ 
  } deriving (Show, Eq, Generic)

instance FromJSON Body where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "body")
instance ToJSON Body where
  toJSON = genericToJSON (removeFieldLabelPrefix False "body")

-- | 
data Body_1 = Body_1
  { body1ShortName :: Text -- ^ The primary `shortName` of the emoji to add. See [/emoji](#emoji)
  , body1SkinVariation :: Text -- ^ The `skinVariation` of the emoji to add. See [/emoji](#emoji)
  , body1Native :: Text -- ^ The emoji to add as a native unicode emoji. See [/emoji](#emoji)
  , body1Unified :: Text -- ^ The `unified` value of the emoji to add. See [/emoji](#emoji)
  } deriving (Show, Eq, Generic)

instance FromJSON Body_1 where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "body1")
instance ToJSON Body_1 where
  toJSON = genericToJSON (removeFieldLabelPrefix False "body1")

-- | 
data Body_2 = Body_2
  { body2FullName :: Text -- ^ The full name of the user to as a member of the board. Must have a length of at least 1 and cannot begin nor end with a space.
  } deriving (Show, Eq, Generic)

instance FromJSON Body_2 where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "body2")
instance ToJSON Body_2 where
  toJSON = genericToJSON (removeFieldLabelPrefix False "body2")

-- | 
data Body_3 = Body_3
  { body3Display'SlashcardFront :: Bool -- ^ Whether to display this custom field on the front of cards
  , body3Pos :: Float -- ^ New position for the custom field. Can also be 'top' or 'bottom'
  , body3Name :: Text -- ^ The name of the Custom Field
  } deriving (Show, Eq, Generic)

instance FromJSON Body_3 where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "body3")
instance ToJSON Body_3 where
  toJSON = genericToJSON (removeFieldLabelPrefix False "body3")

-- | 
data CFValue = CFValue
  { cFValueNumber :: Text -- ^ 
  } deriving (Show, Eq, Generic)

instance FromJSON CFValue where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "cFValue")
instance ToJSON CFValue where
  toJSON = genericToJSON (removeFieldLabelPrefix False "cFValue")

-- | 
data Value_ = Value_
  { value_Text :: Text -- ^ 
  } deriving (Show, Eq, Generic)

instance FromJSON Value_ where
  parseJSON = genericParseJSON (removeFieldLabelPrefix True "value_")
instance ToJSON Value_ where
  toJSON = genericToJSON (removeFieldLabelPrefix False "value_")

-- Remove a field label prefix during JSON parsing.
-- Also perform any replacements for special characters.
removeFieldLabelPrefix :: Bool -> String -> Options
removeFieldLabelPrefix forParsing prefix =
  defaultOptions
  {fieldLabelModifier = fromMaybe (error ("did not find prefix " ++ prefix)) . stripPrefix prefix . replaceSpecialChars}
  where
    replaceSpecialChars field = foldl (&) field (map mkCharReplacement specialChars)
    specialChars =
      [ ("@", "'At")
      , ("\\", "'Back_Slash")
      , ("<=", "'Less_Than_Or_Equal_To")
      , ("\"", "'Double_Quote")
      , ("[", "'Left_Square_Bracket")
      , ("]", "'Right_Square_Bracket")
      , ("^", "'Caret")
      , ("_", "'Underscore")
      , ("`", "'Backtick")
      , ("!", "'Exclamation")
      , ("#", "'Hash")
      , ("$", "'Dollar")
      , ("%", "'Percent")
      , ("&", "'Ampersand")
      , ("'", "'Quote")
      , ("(", "'Left_Parenthesis")
      , (")", "'Right_Parenthesis")
      , ("*", "'Star")
      , ("+", "'Plus")
      , (",", "'Comma")
      , ("-", "'Dash")
      , (".", "'Period")
      , ("/", "'Slash")
      , (":", "'Colon")
      , ("{", "'Left_Curly_Bracket")
      , ("|", "'Pipe")
      , ("<", "'LessThan")
      , ("!=", "'Not_Equal")
      , ("=", "'Equal")
      , ("}", "'Right_Curly_Bracket")
      , (">", "'GreaterThan")
      , ("~", "'Tilde")
      , ("?", "'Question_Mark")
      , (">=", "'Greater_Than_Or_Equal_To")
      ]
    mkCharReplacement (replaceStr, searchStr) = T.unpack . replacer (T.pack searchStr) (T.pack replaceStr) . T.pack
    replacer =
      if forParsing
        then flip T.replace
        else T.replace
