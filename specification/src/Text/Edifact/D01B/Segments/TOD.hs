{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Segments.TOD
  ( -- * Definition
    segmentTOD
    -- * Dependencies
  , compositeC100
  , simple4055
  , simple4215
  ) where

import           Text.Edifact.D01B.Composites (compositeC100)
import           Text.Edifact.D01B.Simples    (simple4055, simple4215)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >        TOD  TERMS OF DELIVERY OR TRANSPORT
-- >
-- >        Function: To specify terms of delivery or transport.
-- >
-- > 010    4055 DELIVERY OR TRANSPORT TERMS FUNCTION CODE  C    1 an..3
-- >
-- > 020    4215 TRANSPORT CHARGES PAYMENT METHOD CODE      C    1 an..3
-- >
-- > 030    C100 TERMS OF DELIVERY OR TRANSPORT             C    1
-- >        4053  Delivery or transport terms description
-- >              code                                      C      an..3
-- >        1131  Code list identification code             C      an..17
-- >        3055  Code list responsible agency code         C      an..3
-- >        4052  Delivery or transport terms description   C      an..70
-- >        4052  Delivery or transport terms description   C      an..70
--
-- Dependencies: 'compositeC100', 'simple4055', 'simple4215'.
segmentTOD :: Parser Value
segmentTOD =
  segment "TOD"
    [ "010" .@ optional  simple4055
    , "020" .@ optional  simple4215
    , "030" .@ optional  compositeC100
    ]
