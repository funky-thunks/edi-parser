{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Composites.C819
  ( -- * Definition
    compositeC819
    -- * Dependencies
  , simple1131
  , simple3055
  , simple3228
  , simple3229
  ) where

import           Text.Edifact.D01B.Simples (simple1131, simple3055, simple3228,
                                            simple3229)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >        C819 COUNTRY SUB-ENTITY DETAILS
-- >
-- >        Desc: To specify a part of a country (eg county or part of
-- >              a city).
-- >
-- > 010    3229  Country sub-entity name code              C      an..9
-- > 020    1131  Code list identification code             C      an..17
-- > 030    3055  Code list responsible agency code         C      an..3
-- > 040    3228  Country sub-entity name                   C      an..70
--
-- Dependencies: 'simple1131', 'simple3055', 'simple3228', 'simple3229'.
compositeC819 :: Parser Value
compositeC819 =
  composite "C819"
    [ "010" .@ optional  simple3229
    , "020" .@ optional  simple1131
    , "030" .@ optional  simple3055
    , "040" .@ optional  simple3228
    ]
