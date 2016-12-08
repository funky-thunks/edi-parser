{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Composites.C215
  ( -- * Definition
    compositeC215
    -- * Dependencies
  , simple1131
  , simple3055
  , simple9302
  , simple9303
  ) where

import           Text.Edifact.D01B.Simples (simple1131, simple3055, simple9302,
                                            simple9303)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >        C215 SEAL ISSUER
-- >
-- >        Desc: Identification of the issuer of a seal on equipment
-- >              either by code or by name.
-- >
-- > 010    9303  Sealing party name code                   C      an..3
-- > 020    1131  Code list identification code             C      an..17
-- > 030    3055  Code list responsible agency code         C      an..3
-- > 040    9302  Sealing party name                        C      an..35
--
-- Dependencies: 'simple1131', 'simple3055', 'simple9302', 'simple9303'.
compositeC215 :: Parser Value
compositeC215 =
  composite "C215"
    [ "010" .@ optional  simple9303
    , "020" .@ optional  simple1131
    , "030" .@ optional  simple3055
    , "040" .@ optional  simple9302
    ]
