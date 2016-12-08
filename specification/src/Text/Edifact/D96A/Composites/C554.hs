{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C554
  ( -- * Definition
    compositeC554
    -- * Dependencies
  , simple1131
  , simple3055
  , simple5243
  ) where

import           Text.Edifact.D96A.Simples (simple1131, simple3055, simple5243)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C554  RATE/TARIFF CLASS DETAIL
-- >
-- >       Desc: Identification of the applicable rate/tariff class.
-- >
-- > 010   5243   Rate/tariff class identification              C  an..9
-- > 020   1131   Code list qualifier                           C  an..3
-- > 030   3055   Code list responsible agency, coded           C  an..3
--
-- Dependencies: 'simple1131', 'simple3055', 'simple5243'.
compositeC554 :: Parser Value
compositeC554 =
  composite "C554"
    [ "010" .@ optional  simple5243
    , "020" .@ optional  simple1131
    , "030" .@ optional  simple3055
    ]
