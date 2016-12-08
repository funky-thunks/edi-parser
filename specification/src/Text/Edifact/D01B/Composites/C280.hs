{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Composites.C280
  ( -- * Definition
    compositeC280
    -- * Dependencies
  , simple6152
  , simple6162
  , simple6411
  ) where

import           Text.Edifact.D01B.Simples (simple6152, simple6162, simple6411)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >        C280 RANGE
-- >
-- >        Desc: Range minimum and maximum limits.
-- >
-- > 010    6411  Measurement unit code                     M      an..3
-- > 020    6162  Range minimum value                       C      n..18
-- > 030    6152  Range maximum value                       C      n..18
--
-- Dependencies: 'simple6152', 'simple6162', 'simple6411'.
compositeC280 :: Parser Value
compositeC280 =
  composite "C280"
    [ "010" .@ mandatory simple6411
    , "020" .@ optional  simple6162
    , "030" .@ optional  simple6152
    ]
