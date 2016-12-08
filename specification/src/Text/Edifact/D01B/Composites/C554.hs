{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Composites.C554
  ( -- * Definition
    compositeC554
    -- * Dependencies
  , simple1131
  , simple3055
  , simple5243
  ) where

import           Text.Edifact.D01B.Simples (simple1131, simple3055, simple5243)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >        C554 RATE/TARIFF CLASS DETAIL
-- >
-- >        Desc: Identification of the applicable rate/tariff class.
-- >
-- > 010    5243  Rate or tariff class description code     C      an..9
-- > 020    1131  Code list identification code             C      an..17
-- > 030    3055  Code list responsible agency code         C      an..3
--
-- Dependencies: 'simple1131', 'simple3055', 'simple5243'.
compositeC554 :: Parser Value
compositeC554 =
  composite "C554"
    [ "010" .@ optional  simple5243
    , "020" .@ optional  simple1131
    , "030" .@ optional  simple3055
    ]
