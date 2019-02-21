{-# LANGUAGE QuasiQuotes #-}

module Main (main) where

import BasicPrelude
import Data.Either (isRight)
import Data.Text (stripEnd)
import Data.Yaml (decodeFileThrow)
import Test.Tasty (TestTree, defaultMain, testGroup)
import Test.Tasty.HUnit (testCase, assertBool)
import Text.RawString.QQ (r)

import DocParsing


main :: IO ()
main
  = defaultMain $ testGroup "Tests" [
      docParseTests,
      getResponseTests
    ]

testCasePath :: FilePath
testCasePath = "scraper/test/testcases"

docParseTests :: TestTree
docParseTests
  = testGroup "extractCodeBlockContents" (map test cases)
  where
    test (name, inputM) = testCase name $ do
      input <- inputM
      let res = extractCodeBlockContents "" (stripEnd input)

      assertBool (show res)
        . isRight
        $ res

    cases = [
        ("Simple case", pure [r|
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

        ("Multiple blocks", readFile $ testCasePath </> "docParseMultiBlock.txt"),

        -- This isn't a code block, so we expect no parse
        ("Empty case", pure [r|
          [block:callout]
          {
            "type": "danger",
            "title": "",
            "body": "Deleting a custom field definition will also delete all of the values across all cards that have been set for that custom field. There is no way to get those values back after they have been deleted."
          }
          [/block]
      |])
      ]

getResponseTests :: TestTree
getResponseTests
  = testGroup "getResponseTests" [
      testResponse "getResponseFromApi",
      testResponse "getResponseFromBody"
    ]
  where
    testResponse name = testCase name $ do
      actual <- getResponse <$> decodeFileThrow (testCasePath </> name ++ ".yaml")
      assertBool (show actual) $ isJust actual

