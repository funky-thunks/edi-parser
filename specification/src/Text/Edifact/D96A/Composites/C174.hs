{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C174
  ( -- * Definition
    compositeC174
    -- * Dependencies
  , simple6152
  , simple6162
  , simple6314
  , simple6411
  , simple6432
  ) where

import           Text.Edifact.D96A.Simples (simple6152, simple6162, simple6314,
                                            simple6411, simple6432)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C174  VALUE/RANGE
-- >
-- >       Desc: Measurement value and relevant minimum and maximum
-- >             tolerances in that order.
-- >
-- > 010   6411   Measure unit qualifier                        M  an..3
-- > 020   6314   Measurement value                             C  n..18
-- > 030   6162   Range minimum                                 C  n..18
-- > 040   6152   Range maximum                                 C  n..18
-- > 050   6432   Significant digits                            C  n..2
--
-- Dependencies: 'simple6152', 'simple6162', 'simple6314', 'simple6411', 'simple6432'.
compositeC174 :: Parser Value
compositeC174 =
  composite "C174"
    [ "010" .@ mandatory simple6411
    , "020" .@ optional  simple6314
    , "030" .@ optional  simple6162
    , "040" .@ optional  simple6152
    , "050" .@ optional  simple6432
    ]
