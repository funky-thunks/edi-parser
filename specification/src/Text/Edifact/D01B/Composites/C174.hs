{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Composites.C174
  ( -- * Definition
    compositeC174
    -- * Dependencies
  , simple6152
  , simple6162
  , simple6314
  , simple6411
  , simple6432
  ) where

import           Text.Edifact.D01B.Simples (simple6152, simple6162, simple6314,
                                            simple6411, simple6432)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >        C174 VALUE/RANGE
-- >
-- >        Desc: Measurement value and relevant minimum and maximum
-- >              values of the measurement range.
-- >
-- > 010    6411  Measurement unit code                     M      an..3
-- > 020    6314  Measurement value                         C      an..18
-- > 030    6162  Range minimum value                       C      n..18
-- > 040    6152  Range maximum value                       C      n..18
-- > 050    6432  Significant digits quantity               C      n..2
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
