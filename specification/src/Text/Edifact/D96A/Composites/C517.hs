{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C517
  ( -- * Definition
    compositeC517
    -- * Dependencies
  , simple1131
  , simple3055
  , simple3224
  , simple3225
  ) where

import           Text.Edifact.D96A.Simples (simple1131, simple3055, simple3224,
                                            simple3225)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C517  LOCATION IDENTIFICATION
-- >
-- >       Desc: Identification of a location by code or name.
-- >
-- > 010   3225   Place/location identification                 C  an..25
-- > 020   1131   Code list qualifier                           C  an..3
-- > 030   3055   Code list responsible agency, coded           C  an..3
-- > 040   3224   Place/location                                C  an..70
--
-- Dependencies: 'simple1131', 'simple3055', 'simple3224', 'simple3225'.
compositeC517 :: Parser Value
compositeC517 =
  composite "C517"
    [ "010" .@ optional  simple3225
    , "020" .@ optional  simple1131
    , "030" .@ optional  simple3055
    , "040" .@ optional  simple3224
    ]
