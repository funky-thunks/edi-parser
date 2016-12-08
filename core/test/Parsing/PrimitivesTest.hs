{-# LANGUAGE OverloadedStrings #-}

module Parsing.PrimitivesTest
  ( suite
  ) where

import           Text.Edifact.Parsing

import           Data.Text                      (Text, unpack)
import           Text.Parsec                    (eof)

import           Test.Framework
import           Test.Framework.Providers.HUnit (testCase)
import           Test.HUnit                     ((@?=))

suite :: Test
suite =
  testGroup "Primitives"
    [ test_an
    , test_an_3
    , test_an3
    , test_n
    ]

test_an :: Test
test_an =
  let parser = alphaNumeric
  in testGroup "an"
       [ expectSuccess parser "A"  'A'
       , expectSuccess parser "?:" ':'
       , expectSuccess parser "?+" '+'
       , expectSuccess parser "??" '?'
       , expectSuccess parser "?'" '\''
       ]

test_an_3 :: Test
test_an_3 =
  let parser = alphaNumeric `upTo` 3
  in testGroup "an..3"
       [ testGroup "valid"
         [ expectSuccess parser ""     ""
         , expectSuccess parser "A"    "A"
         , expectSuccess parser "AB"   "AB"
         , expectSuccess parser "ABC"  "ABC"
         , expectSuccess parser "AB??" "AB?"
         ]
       , testGroup "invalid"
         [ expectFailure parser "ABCD"
         ]
       ]

test_an3 :: Test
test_an3 =
  let parser = alphaNumeric `exactly` 3
  in testGroup "an3"
       [ testGroup "valid"
         [ expectSuccess parser "ABC"  "ABC"
         , expectSuccess parser "AB??" "AB?"
         ]
       , testGroup "invalid"
        [ expectFailure parser ""
        , expectFailure parser "A"
        , expectFailure parser "AB"
        , expectFailure parser "ABCD"
        ]
      ]

test_n :: Test
test_n =
  let parser = numeric
  in testGroup "n"
       [ testGroup "valid"
         [ expectSuccess parser "0" '0'
         , expectSuccess parser "1" '1'
         , expectSuccess parser "2" '2'
         , expectSuccess parser "3" '3'
         , expectSuccess parser "4" '4'
         , expectSuccess parser "5" '5'
         , expectSuccess parser "6" '6'
         , expectSuccess parser "7" '7'
         , expectSuccess parser "8" '8'
         , expectSuccess parser "9" '9'
         , expectSuccess parser "-" '-'
         , expectSuccess parser "." '.'
         ]
       , testGroup "invalid"
         [ expectFailure parser "A"
         , expectFailure parser "?:"
         , expectFailure parser "?+"
         , expectFailure parser "??"
         , expectFailure parser "?'"
         ]
       ]

expectSuccess :: (Show a, Eq a) => Parser a -> Text -> a -> Test
expectSuccess p t = expectParse p t . pure

expectFailure :: (Show a, Eq a) => Parser a -> Text -> Test
expectFailure p t = expectParse p t Nothing

expectParse :: (Show a, Eq a) => Parser a -> Text -> Maybe a -> Test
expectParse p t e =
  let either2Maybe = either (const Nothing) Just
      title = "\"" <> unpack t <> "\""
  in testCase title (either2Maybe (parse (p <* eof) t) @?= e)
