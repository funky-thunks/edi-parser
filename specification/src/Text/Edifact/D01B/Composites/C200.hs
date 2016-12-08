{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Composites.C200
  ( -- * Definition
    compositeC200
    -- * Dependencies
  , simple1131
  , simple3055
  , simple4237
  , simple7140
  , simple8022
  , simple8023
  ) where

import           Text.Edifact.D01B.Simples (simple1131, simple3055, simple4237,
                                            simple7140, simple8022, simple8023)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >        C200 CHARGE
-- >
-- >        Desc: Identification of a charge by code and/or by name.
-- >
-- > 010    8023  Freight and other charges description
-- >              identifier                                C      an..17
-- > 020    1131  Code list identification code             C      an..17
-- > 030    3055  Code list responsible agency code         C      an..3
-- > 040    8022  Freight and other charges description     C      an..26
-- > 050    4237  Payment arrangement code                  C      an..3
-- > 060    7140  Item identifier                           C      an..35
--
-- Dependencies: 'simple1131', 'simple3055', 'simple4237', 'simple7140', 'simple8022', 'simple8023'.
compositeC200 :: Parser Value
compositeC200 =
  composite "C200"
    [ "010" .@ optional  simple8023
    , "020" .@ optional  simple1131
    , "030" .@ optional  simple3055
    , "040" .@ optional  simple8022
    , "050" .@ optional  simple4237
    , "060" .@ optional  simple7140
    ]
