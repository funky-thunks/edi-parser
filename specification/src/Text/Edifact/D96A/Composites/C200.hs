{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C200
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

import           Text.Edifact.D96A.Simples (simple1131, simple3055, simple4237,
                                            simple7140, simple8022, simple8023)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >     * C200  CHARGE
-- >
-- >       Desc: Identification of a charge by code and/or by name.
-- >
-- > 010   8023   Freight and charges identification            C  an..17
-- > 020   1131   Code list qualifier                           C  an..3
-- > 030   3055   Code list responsible agency, coded           C  an..3
-- > 040   8022   Freight and charges                           C  an..26
-- > 050   4237   Prepaid/collect indicator, coded              C  an..3
-- > 060 + 7140   Item number                                   C  an..35
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
