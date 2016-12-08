{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Composites.C234
  ( -- * Definition
    compositeC234
    -- * Dependencies
  , simple7088
  , simple7124
  ) where

import           Text.Edifact.D01B.Simples (simple7088, simple7124)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >        C234 UNDG INFORMATION
-- >
-- >        Desc: Information on dangerous goods, taken from the
-- >              United Nations Dangerous Goods classification.
-- >
-- > 010    7124  United Nations Dangerous Goods (UNDG)
-- >              identifier                                C      n4
-- > 020    7088  Dangerous goods flashpoint value          C      an..8
--
-- Dependencies: 'simple7088', 'simple7124'.
compositeC234 :: Parser Value
compositeC234 =
  composite "C234"
    [ "010" .@ optional  simple7124
    , "020" .@ optional  simple7088
    ]
