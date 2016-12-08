{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C223
  ( -- * Definition
    compositeC223
    -- * Dependencies
  , simple6411
  , simple7106
  ) where

import           Text.Edifact.D96A.Simples (simple6411, simple7106)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C223  DANGEROUS GOODS SHIPMENT FLASHPOINT
-- >
-- >       Desc: Temperature at which a vapor according to ISO 1523/73 can
-- >             be ignited.
-- >
-- > 010   7106   Shipment flashpoint                           C  n3
-- > 020   6411   Measure unit qualifier                        C  an..3
--
-- Dependencies: 'simple6411', 'simple7106'.
compositeC223 :: Parser Value
compositeC223 =
  composite "C223"
    [ "010" .@ optional  simple7106
    , "020" .@ optional  simple6411
    ]
