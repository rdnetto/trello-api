{-# LANGUAGE QuasiQuotes #-}

module Main (main) where

import BasicPrelude
import Data.Either (isRight)
import Data.Text (stripEnd)
import Test.Tasty (TestTree, defaultMain, testGroup)
import Test.Tasty.HUnit (testCase, assertBool)
import Text.RawString.QQ (r)

import DocParsing


main :: IO ()
main
  = defaultMain $ testGroup "Tests" [
      docParseTests
    ]

docParseTests :: TestTree
docParseTests
  = testGroup "extractCodeBlockContents" (map test cases)
  where
    test (name, input)
      = testCase name
      . assertBool (show res)
      . isRight
      $ res
      where
        res = extractCodeBlockContents "" (stripEnd input)

    cases = [
        ("Simple case", [r|
          [block:code]
          {
            "codes": [
              {
                "code": "https://api.trello.com/1/actions/592f11060f95a3d3d46a987a",
                "language": "curl"
              }
            ]
          }
          [/block]
        |]),

        ("Multiple blocks", [r|
          Here's some data
          [block:parameters]
          {
            "data": {
              "0-0": "**id**\nstring",
              "0-1": "The ID of the action",
              "1-0": "**data**\nobject",
              "2-0": "**date**\ndate",
              "2-1": "When the action occurred",
              "3-0": "**idMemberCreator**\nstring",
              "3-1": "The ID of the member who caused the action",
              "4-0": "**type**\nstring",
              "4-1": "The type of the action. See list of [Action Types](ref:action-types) for options.",
              "1-1": "Relevant information regarding the action"
            },
            "cols": 2,
            "rows": 5
          }
          [/block]
          Here's some more
          [block:code]
          {
            "codes": [
              {
                "code": "https://api.trello.com/1/actions/592f11060f95a3d3d46a987a",
                "language": "curl"
              }
            ]
          }
          [/block]
          And finally the JSON
          [block:code]
          {
            "codes": [
              {
                "code": "{\n  \"id\": \"592f11060f95a3d3d46a987a\",\n  \"idMemberCreator\": \"5191197f9433cf5507006338\",\n  \"data\": {\n    \"list\": {\n      \"name\": \"Professional\",\n      \"id\": \"54a17e9db559f0356ce022e4\"\n    },\n    \"board\": {\n      \"shortLink\": \"BdarzfKF\",\n      \"name\": \"Life Goals\",\n      \"id\": \"54a17d76d4a5072e3931736b\"\n    },\n    \"card\": {\n      \"shortLink\": \"gplJv6dx\",\n      \"idShort\": 2,\n      \"name\": \"Increase revenue by 10%\",\n      \"id\": \"54a1844d304d9736e54d2546\",\n      \"due\": \"2017-12-12T17:00:00.000Z\"\n    },\n    \"old\": {\n      \"due\": \"2017-05-01T16:00:00.000Z\"\n    }\n  },\n  \"type\": \"updateCard\",\n  \"date\": \"2017-05-31T18:52:54.933Z\",\n  \"memberCreator\": {\n    \"id\": \"5191197f9433cf5507006338\",\n    \"avatarHash\": \"ae0fde383cc2a195c053f1ad42c02022\",\n    \"fullName\": \"Brian Cervino\",\n    \"initials\": \"BC\",\n    \"username\": \"brian\"\n  },\n  \"display\": {\n    \"translationKey\": \"action_changed_a_due_date\",\n    \"entities\": {\n      \"card\": {\n        \"type\": \"card\",\n        \"due\": \"2017-12-12T17:00:00.000Z\",\n        \"id\": \"54a1844d304d9736e54d2546\",\n        \"shortLink\": \"gplJv6dx\",\n        \"text\": \"Increase revenue by 10%\"\n      },\n      \"date\": {\n        \"type\": \"date\",\n        \"date\": \"2017-12-12T17:00:00.000Z\"\n      },\n      \"memberCreator\": {\n        \"type\": \"member\",\n        \"id\": \"5191197f9433cf5507006338\",\n        \"username\": \"brian\",\n        \"text\": \"Brian Cervino\"\n      }\n    }\n  }\n}",
                "language": "json"
              }
            ]
          }
          [/block]
        |]),

        -- This isn't a code block, so we expect no parse
        ("Empty case", [r|
          [block:callout]
          {
            "type": "danger",
            "title": "",
            "body": "Deleting a custom field definition will also delete all of the values across all cards that have been set for that custom field. There is no way to get those values back after they have been deleted."
          }
          [/block]
      |])
      ]

