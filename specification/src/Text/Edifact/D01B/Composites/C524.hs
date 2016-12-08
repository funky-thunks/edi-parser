{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Composites.C524
  ( -- * Definition
    compositeC524
    -- * Dependencies
  , simple1131
  , simple3055
  , simple4078
  , simple4079
  ) where

import           Text.Edifact.D01B.Simples (simple1131, simple3055, simple4078,
                                            simple4079)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >        C524 HANDLING INSTRUCTIONS
-- >
-- >        Desc: Instruction for the handling of goods, products or
-- >              articles in shipment, storage etc.
-- >
-- > 010    4079  Handling instruction description code     C      an..3
-- > 020    1131  Code list identification code             C      an..17
-- > 030    3055  Code list responsible agency code         C      an..3
-- > 040    4078  Handling instruction description          C      an..70
--
-- Dependencies: 'simple1131', 'simple3055', 'simple4078', 'simple4079'.
compositeC524 :: Parser Value
compositeC524 =
  composite "C524"
    [ "010" .@ optional  simple4079
    , "020" .@ optional  simple1131
    , "030" .@ optional  simple3055
    , "040" .@ optional  simple4078
    ]
