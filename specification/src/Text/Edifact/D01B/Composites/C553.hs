{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Composites.C553
  ( -- * Definition
    compositeC553
    -- * Dependencies
  , simple1131
  , simple3055
  , simple3232
  , simple3233
  ) where

import           Text.Edifact.D01B.Simples (simple1131, simple3055, simple3232,
                                            simple3233)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >        C553 RELATED LOCATION TWO IDENTIFICATION
-- >
-- >        Desc: Identification of second related location by code or
-- >              name.
-- >
-- > 010    3233  Second related location name code         C      an..25
-- > 020    1131  Code list identification code             C      an..17
-- > 030    3055  Code list responsible agency code         C      an..3
-- > 040    3232  Second related location name              C      an..70
--
-- Dependencies: 'simple1131', 'simple3055', 'simple3232', 'simple3233'.
compositeC553 :: Parser Value
compositeC553 =
  composite "C553"
    [ "010" .@ optional  simple3233
    , "020" .@ optional  simple1131
    , "030" .@ optional  simple3055
    , "040" .@ optional  simple3232
    ]
