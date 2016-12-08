{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Composites.C224
  ( -- * Definition
    compositeC224
    -- * Dependencies
  , simple1131
  , simple3055
  , simple8154
  , simple8155
  ) where

import           Text.Edifact.D01B.Simples (simple1131, simple3055, simple8154,
                                            simple8155)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >        C224 EQUIPMENT SIZE AND TYPE
-- >
-- >        Desc: Code and or name identifying size and type of
-- >              equipment. Code preferred.
-- >
-- > 010    8155  Equipment size and type description code  C      an..10
-- > 020    1131  Code list identification code             C      an..17
-- > 030    3055  Code list responsible agency code         C      an..3
-- > 040    8154  Equipment size and type description       C      an..35
--
-- Dependencies: 'simple1131', 'simple3055', 'simple8154', 'simple8155'.
compositeC224 :: Parser Value
compositeC224 =
  composite "C224"
    [ "010" .@ optional  simple8155
    , "020" .@ optional  simple1131
    , "030" .@ optional  simple3055
    , "040" .@ optional  simple8154
    ]
