{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C203
  ( -- * Definition
    compositeC203
    -- * Dependencies
  , simple1131
  , simple3055
  , simple5242
  , simple5243
  , simple5275
  ) where

import           Text.Edifact.D96A.Simples (simple1131, simple3055, simple5242,
                                            simple5243, simple5275)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C203  RATE/TARIFF CLASS
-- >
-- >       Desc: Identification of the applicable rate/tariff class.
-- >
-- > 010   5243   Rate/tariff class identification              M  an..9
-- > 020   1131   Code list qualifier                           C  an..3
-- > 030   3055   Code list responsible agency, coded           C  an..3
-- > 040   5242   Rate/tariff class                             C  an..35
-- > 050   5275   Supplementary rate/tariff basis               C  an..6
-- >              identification
-- > 060   1131   Code list qualifier                           C  an..3
-- > 070   3055   Code list responsible agency, coded           C  an..3
-- > 080   5275   Supplementary rate/tariff basis               C  an..6
-- >              identification
-- > 090   1131   Code list qualifier                           C  an..3
-- > 100   3055   Code list responsible agency, coded           C  an..3
--
-- Dependencies: 'simple1131', 'simple3055', 'simple5242', 'simple5243', 'simple5275'.
compositeC203 :: Parser Value
compositeC203 =
  composite "C203"
    [ "010" .@ mandatory simple5243
    , "020" .@ optional  simple1131
    , "030" .@ optional  simple3055
    , "040" .@ optional  simple5242
    , "050" .@ optional  simple5275
    , "060" .@ optional  simple1131
    , "070" .@ optional  simple3055
    , "080" .@ optional  simple5275
    , "090" .@ optional  simple1131
    , "100" .@ optional  simple3055
    ]
