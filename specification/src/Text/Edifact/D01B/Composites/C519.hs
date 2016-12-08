{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Composites.C519
  ( -- * Definition
    compositeC519
    -- * Dependencies
  , simple1131
  , simple3055
  , simple3222
  , simple3223
  ) where

import           Text.Edifact.D01B.Simples (simple1131, simple3055, simple3222,
                                            simple3223)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >        C519 RELATED LOCATION ONE IDENTIFICATION
-- >
-- >        Desc: Identification the first related location by code or
-- >              name.
-- >
-- > 010    3223  First related location name code          C      an..25
-- > 020    1131  Code list identification code             C      an..17
-- > 030    3055  Code list responsible agency code         C      an..3
-- > 040    3222  First related location name               C      an..70
--
-- Dependencies: 'simple1131', 'simple3055', 'simple3222', 'simple3223'.
compositeC519 :: Parser Value
compositeC519 =
  composite "C519"
    [ "010" .@ optional  simple3223
    , "020" .@ optional  simple1131
    , "030" .@ optional  simple3055
    , "040" .@ optional  simple3222
    ]
