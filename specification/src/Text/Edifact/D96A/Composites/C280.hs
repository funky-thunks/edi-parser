{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C280
  ( -- * Definition
    compositeC280
    -- * Dependencies
  , simple6152
  , simple6162
  , simple6411
  ) where

import           Text.Edifact.D96A.Simples (simple6152, simple6162, simple6411)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C280  RANGE
-- >
-- >       Desc: Range minimum and maximum limits.
-- >
-- > 010   6411   Measure unit qualifier                        M  an..3
-- > 020   6162   Range minimum                                 C  n..18
-- > 030   6152   Range maximum                                 C  n..18
--
-- Dependencies: 'simple6152', 'simple6162', 'simple6411'.
compositeC280 :: Parser Value
compositeC280 =
  composite "C280"
    [ "010" .@ mandatory simple6411
    , "020" .@ optional  simple6162
    , "030" .@ optional  simple6152
    ]
