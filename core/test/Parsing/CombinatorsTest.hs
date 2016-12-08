{-# LANGUAGE OverloadedStrings #-}

module Parsing.CombinatorsTest
  ( suite
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types

import           Data.Text                      (Text, unpack)
import           Text.Parsec                    (eof)

import           Test.Framework
import           Test.Framework.Providers.HUnit (testCase)
import           Test.HUnit                     ((@?=))

suite :: Test
suite =
  testGroup "Combinators"
    [ testMessage
    , testSegmentGroup
    , testSegment
    , testComposite
    ]

testMessage :: Test
testMessage =
  testGroup "Message"
    [ testGroup "repeated"
      [ expectSuccess messageABCDEF "TAG'" $
          Message "ABCDEF" [ "0010" .= Group "sg1" [ "010" .= Segment "TAG" []
                                                   , ("020", [])
                                                   ]
                           ]
      , expectSuccess messageABCDEF "TAG'TAG'" $
          Message "ABCDEF" [ "0010" .= Group "sg1" [ ("010", [ Segment "TAG" []
                                                             , Segment "TAG" []
                                                             ])
                                                   , ("020", [])
                                                   ]
                           ]
      , expectFailure messageABCDEF "TAG'TAG'TAG'"
      , expectSuccess messageABCDEF "TAG'ANN'" $
          Message "ABCDEF" [ "0010" .= Group "sg1" [ "010" .= Segment "TAG" []
                                                   , "020" .= Segment "ANN" []
                                                   ]
                           ]
      , expectSuccess messageABCDEF "ANN'" $
          Message "ABCDEF" [ "0010" .= Group "sg1" [ ("010", [])
                                                   , "020" .= Segment "ANN" []
                                                   ]
                           ]
      ]
    , testGroup "mandatory repeated"
      [ expectSuccess messageGHIJKL "TAG'" $
          Message "GHIJKL" [ "0010" .= Group "sg2" [ "010" .= Segment "TAG" []
                                                   , ("020", [])
                                                   ]
                           ]
      , expectSuccess messageGHIJKL "TAG'TAG'" $
          Message "GHIJKL" [ "0010" .= Group "sg2" [ ("010", [ Segment "TAG" []
                                                             , Segment "TAG" []
                                                             ])
                                                   , ("020", [])
                                                   ]
                           ]
      , expectFailure messageGHIJKL "TAG'TAG'TAG'"
      , expectSuccess messageGHIJKL "TAG'ANN'" $
          Message "GHIJKL" [ "0010" .= Group "sg2" [ "010" .= Segment "TAG" []
                                                   , "020" .= Segment "ANN" []
                                                   ]
                           ]
      , expectFailure messageGHIJKL "ANN'"
      ]
    ]

messageABCDEF :: Parser Value
messageABCDEF = message "ABCDEF" [ once sg1 @. "0010"
                                 ]

messageGHIJKL :: Parser Value
messageGHIJKL = message "GHIJKL" [ once sg2 @. "0010"
                                 ]

testSegmentGroup :: Test
testSegmentGroup =
  testGroup "Segment Group"
    [ testGroup "repeated"
      [ expectSuccess sg1 "TAG'" $
          Group "sg1" [ "010" .= Segment "TAG" []
                      , ("020", [])
                      ]
      , expectSuccess sg1 "TAG'TAG'" $
          Group "sg1" [ ("010", [ Segment "TAG" []
                                , Segment "TAG" []
                                ])
                      , ("020", [])
                      ]
      , expectFailure sg1 "TAG'TAG'TAG'"
      , expectSuccess sg1 "TAG'ANN'" $
          Group "sg1" [ "010" .= Segment "TAG" []
                      , "020" .= Segment "ANN" []
                      ]
      , expectSuccess sg1 "ANN'" $
          Group "sg1" [ ("010", [])
                      , "020" .= Segment "ANN" []
                      ]
      ]
    , testGroup "mandatory repeated"
      [ expectSuccess sg2 "TAG'" $
          Group "sg2" [ "010" .= Segment "TAG" []
                      , ("020", [])
                      ]
      , expectSuccess sg2 "TAG'TAG'" $
          Group "sg2" [ ("010", [ Segment "TAG" []
                                , Segment "TAG" []
                                ])
                      , ("020", [])
                      ]
      , expectFailure sg2 "TAG'TAG'TAG'"
      , expectSuccess sg2 "TAG'ANN'" $
          Group "sg2" [ "010" .= Segment "TAG" []
                      , "020" .= Segment "ANN" []
                      ]
      , expectFailure sg2 "ANN'"
      ]
    ]

sg1 :: Parser Value
sg1 = segmentGroup "sg1" [ repeated 2 segmentTAG @. "010"
                         , repeated 9 segmentANN @. "020"
                         ]

sg2 :: Parser Value
sg2 = segmentGroup "sg2" [ repeatedAtLeastOnce 2 segmentTAG @. "010"
                         , repeated            9 segmentANN @. "020"
                         ]

segmentTAG :: Parser Value
segmentTAG =
  segment "TAG" [ optional s01 @. "010"
                , optional s02 @. "020"
                , optional s03 @. "030"
                , optional c01 @. "040"
                ]

segmentANN :: Parser Value
segmentANN =
  segment "ANN" [ optional s01 @. "010"
                ]

s01 :: Parser Value
s01 = simple "S01" an2

s02 :: Parser Value
s02 = simple "S02" an2

s03 :: Parser Value
s03 = simple "S03" an2

s04 :: Parser Value
s04 = simple "S04" an2

s05 :: Parser Value
s05 = simple "S05" an2

s06 :: Parser Value
s06 = simple "S06" an2

c01 :: Parser Value
c01 = composite "C01" [ mandatory s04 @. "010"
                      , mandatory s05 @. "020"
                      , mandatory s06 @. "030"
                      ]

testSegment :: Test
testSegment =
  let parser = segment "TAG" [ optional s01 @. "010"
                             , optional s02 @. "020"
                             , optional s03 @. "030"
                             , optional c01 @. "040"
                             ]
      parser2 = segment "TAG" [ mandatory s01 @. "010"
                              , optional  s02 @. "020"
                              , optional  s03 @. "030"
                              ]
  in testGroup "Segment"
       [ expectSuccess parser "TAG'" $
           Segment "TAG" []
       , expectSuccess parser "TAG+DE+DE+DE+CE:CE:CE'" $
           Segment "TAG" [ "010" .= Simple "S01" "DE"
                         , "020" .= Simple "S02" "DE"
                         , "030" .= Simple "S03" "DE"
                         , "040" .= Composite "C01" [ "010" .= Simple "S04" "CE"
                                                    , "020" .= Simple "S05" "CE"
                                                    , "030" .= Simple "S06" "CE"
                                                    ]
                         ]
       , expectFailure parser "TAG+DE+DE+CE:CE:CE'"
       , expectSuccess parser "TAG+DE++DE+CE:CE:CE'" $
           Segment "TAG" [ "010" .= Simple "S01" "DE"
                         , ("020", Nothing)
                         , "030" .= Simple "S03" "DE"
                         , "040" .= Composite "C01" [ "010" .= Simple "S04" "CE"
                                                    , "020" .= Simple "S05" "CE"
                                                    , "030" .= Simple "S06" "CE"
                                                    ]
                         ]
       , expectSuccess parser2 "TAG+DE+DE'" $
           Segment "TAG" [ "010" .= Simple "S01" "DE"
                         , "020" .= Simple "S02" "DE"
                         ]
       , expectSuccess parser2 "TAG+DE'" $
           Segment "TAG" [ "010" .= Simple "S01" "DE"
                         ]
       , expectSuccess parser2 "TAG+DE++DE'" $
           Segment "TAG" [ "010" .= Simple "S01" "DE"
                         , ("020", Nothing)
                         , "030" .= Simple "S03" "DE"
                         ]
       ]

testComposite :: Test
testComposite =
  let parser = compositeX001
  in testGroup "Composite"
       [ expectSuccess parser "" $
           Composite "X001" [ "010" .= Simple "1001" ""
                            ]
       , expectSuccess parser "ABC" $
           Composite "X001" [ "010" .= Simple "1001" "ABC"
                            ]
       , expectSuccess parser ":DEF" $
           Composite "X001" [ "010" .= Simple "1001" ""
                            , "020" .= Simple "1001" "DEF"
                            ]
       , expectSuccess parser "ABC:DEF" $
           Composite "X001" [ "010" .= Simple "1001" "ABC"
                            , "020" .= Simple "1001" "DEF"
                            ]
       , expectSuccess parser "ABC:DEF:" $
           Composite "X001" [ "010" .= Simple "1001" "ABC"
                            , "020" .= Simple "1001" "DEF"
                            , "030" .= Simple "1001" ""
                            ]
       , expectSuccess parser "ABC:DEF:GHI" $
           Composite "X001" [ "010" .= Simple "1001" "ABC"
                            , "020" .= Simple "1001" "DEF"
                            , "030" .= Simple "1001" "GHI"
                            ]
       , expectSuccess parser "ABC::GHI" $
           Composite "X001" [ "010" .= Simple "1001" "ABC"
                            , "020" .= Simple "1001" ""
                            , "030" .= Simple "1001" "GHI"
                            ]
       ]

compositeX001 :: Parser Value
compositeX001 =
  composite "X001"
    [ mandatory simple1001 @. "010"
    , optional  simple1001 @. "020"
    , optional  simple1001 @. "030"
    ]

simple1001 :: Parser Value
simple1001 = simple "1001" an_35

an2 :: Parser Primitive
an2 = alpha `exactly` 2

an_35 :: Parser Primitive
an_35 = alphaNumeric `upTo` 35

expectSuccess :: (Show a, Eq a) => Parser a -> Text -> a -> Test
expectSuccess p t = expectParse p t . pure

expectFailure :: (Show a, Eq a) => Parser a -> Text -> Test
expectFailure p t = expectParse p t Nothing

expectParse :: (Show a, Eq a) => Parser a -> Text -> Maybe a -> Test
expectParse p t e =
  let either2Maybe = either (const Nothing) Just
      title = "\"" <> unpack t <> "\""
  in testCase title (either2Maybe (parse (p <* eof) t) @?= e)

(.=) :: Applicative f => Position -> Value -> (Position, f Value)
pos .= value = (pos, pure value)
