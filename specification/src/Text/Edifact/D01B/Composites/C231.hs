{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Composites.C231
  ( -- * Definition
    compositeC231
    -- * Dependencies
  , simple1131
  , simple3055
  , simple4215
  ) where

import           Text.Edifact.D01B.Simples (simple1131, simple3055, simple4215)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >        C231 METHOD OF PAYMENT
-- >
-- >        Desc: Code identifying the method of payment.
-- >
-- > 010    4215  Transport charges payment method code     M      an..3
-- > 020    1131  Code list identification code             C      an..17
-- > 030    3055  Code list responsible agency code         C      an..3
--
-- Dependencies: 'simple1131', 'simple3055', 'simple4215'.
compositeC231 :: Parser Value
compositeC231 =
  composite "C231"
    [ "010" .@ mandatory simple4215
    , "020" .@ optional  simple1131
    , "030" .@ optional  simple3055
    ]
