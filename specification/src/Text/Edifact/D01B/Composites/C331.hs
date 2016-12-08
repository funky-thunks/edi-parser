{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Composites.C331
  ( -- * Definition
    compositeC331
    -- * Dependencies
  , simple1131
  , simple3055
  , simple4494
  , simple4495
  ) where

import           Text.Edifact.D01B.Simples (simple1131, simple3055, simple4494,
                                            simple4495)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >        C331 INSURANCE COVER DETAILS
-- >
-- >        Desc: To provide the insurance cover details.
-- >
-- > 010    4495  Insurance cover description code          C      an..17
-- > 020    1131  Code list identification code             C      an..17
-- > 030    3055  Code list responsible agency code         C      an..3
-- > 040    4494  Insurance cover description               C      an..35
-- > 050    4494  Insurance cover description               C      an..35
--
-- Dependencies: 'simple1131', 'simple3055', 'simple4494', 'simple4495'.
compositeC331 :: Parser Value
compositeC331 =
  composite "C331"
    [ "010" .@ optional  simple4495
    , "020" .@ optional  simple1131
    , "030" .@ optional  simple3055
    , "040" .@ optional  simple4494
    , "050" .@ optional  simple4494
    ]
