{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C528
  ( -- * Definition
    compositeC528
    -- * Dependencies
  , simple1131
  , simple3055
  , simple7357
  ) where

import           Text.Edifact.D96A.Simples (simple1131, simple3055, simple7357)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C528  COMMODITY/RATE DETAIL
-- >
-- >       Desc: Identification of commodity/rates.
-- >
-- > 010   7357   Commodity/rate identification                 C  an..18
-- > 020   1131   Code list qualifier                           C  an..3
-- > 030   3055   Code list responsible agency, coded           C  an..3
--
-- Dependencies: 'simple1131', 'simple3055', 'simple7357'.
compositeC528 :: Parser Value
compositeC528 =
  composite "C528"
    [ "010" .@ optional  simple7357
    , "020" .@ optional  simple1131
    , "030" .@ optional  simple3055
    ]
