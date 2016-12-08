{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Composites.C330
  ( -- * Definition
    compositeC330
    -- * Dependencies
  , simple1131
  , simple3055
  , simple4497
  ) where

import           Text.Edifact.D01B.Simples (simple1131, simple3055, simple4497)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >        C330 INSURANCE COVER TYPE
-- >
-- >        Desc: To provide the insurance cover type.
-- >
-- > 010    4497  Insurance cover type code                 M      an..3
-- > 020    1131  Code list identification code             C      an..17
-- > 030    3055  Code list responsible agency code         C      an..3
--
-- Dependencies: 'simple1131', 'simple3055', 'simple4497'.
compositeC330 :: Parser Value
compositeC330 =
  composite "C330"
    [ "010" .@ mandatory simple4497
    , "020" .@ optional  simple1131
    , "030" .@ optional  simple3055
    ]
