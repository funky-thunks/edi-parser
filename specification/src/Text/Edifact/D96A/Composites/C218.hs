{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C218
  ( -- * Definition
    compositeC218
    -- * Dependencies
  , simple1131
  , simple3055
  , simple7419
  ) where

import           Text.Edifact.D96A.Simples (simple1131, simple3055, simple7419)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C218  HAZARDOUS MATERIAL
-- >
-- >       Desc: Hazardous material code from a specified source.
-- >
-- > 010   7419   Hazardous material class code, identification C  an..4
-- > 020   1131   Code list qualifier                           C  an..3
-- > 030   3055   Code list responsible agency, coded           C  an..3
--
-- Dependencies: 'simple1131', 'simple3055', 'simple7419'.
compositeC218 :: Parser Value
compositeC218 =
  composite "C218"
    [ "010" .@ optional  simple7419
    , "020" .@ optional  simple1131
    , "030" .@ optional  simple3055
    ]
