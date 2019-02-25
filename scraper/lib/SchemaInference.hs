module SchemaInference (inferSchema) where

import Attoparsec.Time.Text (dayInISO8601, utcTimeInISO8601)
import BasicPrelude
import Data.Scientific as S
import Data.Aeson (Value(..))
import Data.Attoparsec.Text (Parser, parseOnly, endOfInput)
import Data.Either (isRight)
import qualified Data.Vector as V
import qualified Data.HashMap.Strict as HMS


-- Given an example JSON object, recursively infer a JSON schema that represents it.
-- See https://swagger.io/docs/specification/describing-responses/, https://swagger.io/docs/specification/data-models/
inferSchema :: Value -> Value
inferSchema Null       = mkObject [("nullable", Bool True)]
inferSchema (Bool _)   = mkObject [("type", String "boolean")]
inferSchema (String s) = mkObject $ typeInfo : formatInfo where
  typeInfo = ("type", String "string")
  formatInfo
    | isDate s     = [("format", String "date")]
    | isDateTime s = [("format", String "date-time")]
    | otherwise    = []
  isDate     = parses dayInISO8601
  isDateTime = parses utcTimeInISO8601
inferSchema (Number num)
  | S.isInteger num = mkObject [("type", String "integer")]
  | otherwise       = mkObject [("type", String "number")]
inferSchema (Array arr)
  | V.null arr = arrayOf unknownType
  | otherwise  = arrayOf . inferSchema $ V.head arr
  where
    arrayOf inner
      = mkObject [
          ("type", String "array"),
          ("items", inner)
        ]
inferSchema (Object obj)
  = mkObject [
      ("type", String "object"),
      ("properties", Object $ HMS.map inferSchema obj)
    ]

-- The "any" type
unknownType :: Value
unknownType = mkObject []

-- Helper function for constructing objects
mkObject :: [(Text, Value)] -> Value
mkObject = Object . HMS.fromList

-- True if the text can be parsed using the provided parser.
parses :: Parser a -> Text -> Bool
parses p = isRight . parseOnly (p <* endOfInput)

