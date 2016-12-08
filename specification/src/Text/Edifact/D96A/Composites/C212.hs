{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C212
  ( -- * Definition
    compositeC212
    -- * Dependencies
  , simple1131
  , simple3055
  , simple7140
  , simple7143
  ) where

import           Text.Edifact.D96A.Simples (simple1131, simple3055, simple7140,
                                            simple7143)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C212  ITEM NUMBER IDENTIFICATION
-- >
-- >       Desc: Goods identification for a specified source.
-- >
-- > 010   7140   Item number                                   C  an..35
-- > 020   7143   Item number type, coded                       C  an..3
-- > 030   1131   Code list qualifier                           C  an..3
-- > 040   3055   Code list responsible agency, coded           C  an..3
--
-- Dependencies: 'simple1131', 'simple3055', 'simple7140', 'simple7143'.
compositeC212 :: Parser Value
compositeC212 =
  composite "C212"
    [ "010" .@ optional  simple7140
    , "020" .@ optional  simple7143
    , "030" .@ optional  simple1131
    , "040" .@ optional  simple3055
    ]
