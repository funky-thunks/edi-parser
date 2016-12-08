{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Composites.C237
  ( -- * Definition
    compositeC237
    -- * Dependencies
  , simple1131
  , simple3055
  , simple3207
  , simple8260
  ) where

import           Text.Edifact.D01B.Simples (simple1131, simple3055, simple3207,
                                            simple8260)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >        C237 EQUIPMENT IDENTIFICATION
-- >
-- >        Desc: Marks (letters/numbers) identifying equipment.
-- >
-- > 010    8260  Equipment identifier                      C      an..17
-- > 020    1131  Code list identification code             C      an..17
-- > 030    3055  Code list responsible agency code         C      an..3
-- > 040    3207  Country name code                         C      an..3
--
-- Dependencies: 'simple1131', 'simple3055', 'simple3207', 'simple8260'.
compositeC237 :: Parser Value
compositeC237 =
  composite "C237"
    [ "010" .@ optional  simple8260
    , "020" .@ optional  simple1131
    , "030" .@ optional  simple3055
    , "040" .@ optional  simple3207
    ]
