{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Composites.C082
  ( -- * Definition
    compositeC082
    -- * Dependencies
  , simple1131
  , simple3039
  , simple3055
  ) where

import           Text.Edifact.D01B.Simples (simple1131, simple3039, simple3055)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >        C082 PARTY IDENTIFICATION DETAILS
-- >
-- >        Desc: Identification of a transaction party by code.
-- >
-- > 010    3039  Party identifier                          M      an..35
-- > 020    1131  Code list identification code             C      an..17
-- > 030    3055  Code list responsible agency code         C      an..3
--
-- Dependencies: 'simple1131', 'simple3039', 'simple3055'.
compositeC082 :: Parser Value
compositeC082 =
  composite "C082"
    [ "010" .@ mandatory simple3039
    , "020" .@ optional  simple1131
    , "030" .@ optional  simple3055
    ]
