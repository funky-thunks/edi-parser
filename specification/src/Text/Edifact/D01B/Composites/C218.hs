{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Composites.C218
  ( -- * Definition
    compositeC218
    -- * Dependencies
  , simple1131
  , simple3055
  , simple7418
  , simple7419
  ) where

import           Text.Edifact.D01B.Simples (simple1131, simple3055, simple7418,
                                            simple7419)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >        C218 HAZARDOUS MATERIAL
-- >
-- >        Desc: To specify a hazardous material.
-- >
-- > 010    7419  Hazardous material category name code     C      an..7
-- > 020    1131  Code list identification code             C      an..17
-- > 030    3055  Code list responsible agency code         C      an..3
-- > 040    7418  Hazardous material category name          C      an..35
--
-- Dependencies: 'simple1131', 'simple3055', 'simple7418', 'simple7419'.
compositeC218 :: Parser Value
compositeC218 =
  composite "C218"
    [ "010" .@ optional  simple7419
    , "020" .@ optional  simple1131
    , "030" .@ optional  simple3055
    , "040" .@ optional  simple7418
    ]
