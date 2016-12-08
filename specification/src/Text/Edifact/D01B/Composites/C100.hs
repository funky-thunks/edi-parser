{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Composites.C100
  ( -- * Definition
    compositeC100
    -- * Dependencies
  , simple1131
  , simple3055
  , simple4052
  , simple4053
  ) where

import           Text.Edifact.D01B.Simples (simple1131, simple3055, simple4052,
                                            simple4053)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >        C100 TERMS OF DELIVERY OR TRANSPORT
-- >
-- >        Desc: Terms of delivery or transport code from a specified
-- >              source.
-- >
-- > 010    4053  Delivery or transport terms description
-- >              code                                      C      an..3
-- > 020    1131  Code list identification code             C      an..17
-- > 030    3055  Code list responsible agency code         C      an..3
-- > 040    4052  Delivery or transport terms description   C      an..70
-- > 050    4052  Delivery or transport terms description   C      an..70
--
-- Dependencies: 'simple1131', 'simple3055', 'simple4052', 'simple4053'.
compositeC100 :: Parser Value
compositeC100 =
  composite "C100"
    [ "010" .@ optional  simple4053
    , "020" .@ optional  simple1131
    , "030" .@ optional  simple3055
    , "040" .@ optional  simple4052
    , "050" .@ optional  simple4052
    ]
