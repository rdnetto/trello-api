{-# LANGUAGE QuasiQuotes #-}

module Main (main) where

import BasicPrelude
import Data.Text (stripEnd)
import Data.Yaml (decodeFileThrow)
import Lens.Micro((^?), _Right)
import Test.Tasty (TestTree, defaultMain, testGroup)
import Test.Tasty.HUnit (testCase, assertBool, assertEqual)
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

-- Tests the extraction of code blocks from documentation blocks
docParseTests :: TestTree
docParseTests
  = testGroup "extractCodeBlockContents" (map test cases)
  where
    test (name, inputM, expectedCount) = testCase name $ do
      input <- inputM
      let res = extractCodeBlockContents "" (stripEnd input)

      assertEqual
        (show res)
        (Just expectedCount)
        (length <$> res ^? _Right)

    cases :: [(String, IO Text, Int)]
      = [
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
        |],
        1
        ),

        ("Multiple blocks",
         readFile $ testCasePath </> "docParseMultiBlock.txt",
         2
        ),

        -- This isn't a code block, so we expect no parse
        ("Empty case",
         pure [r|
          [block:callout]
          {
            "type": "danger",
            "title": "",
            "body": "Deleting a custom field definition will also delete all of the values across all cards that have been set for that custom field. There is no way to get those values back after they have been deleted."
          }
          [/block]
        |],
        0)
      ]

-- End-to-end test of the extraction of the response from a documentation blob
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

