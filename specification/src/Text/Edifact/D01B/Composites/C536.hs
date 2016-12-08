{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Composites.C536
  ( -- * Definition
    compositeC536
    -- * Dependencies
  , simple1131
  , simple3055
  , simple4065
  ) where

import           Text.Edifact.D01B.Simples (simple1131, simple3055, simple4065)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >        C536 CONTRACT AND CARRIAGE CONDITION
-- >
-- >        Desc: To identify a contract and carriage condition.
-- >
-- > 010    4065  Contract and carriage condition code      M      an..3
-- > 020    1131  Code list identification code             C      an..17
-- > 030    3055  Code list responsible agency code         C      an..3
--
-- Dependencies: 'simple1131', 'simple3055', 'simple4065'.
compositeC536 :: Parser Value
compositeC536 =
  composite "C536"
    [ "010" .@ mandatory simple4065
    , "020" .@ optional  simple1131
    , "030" .@ optional  simple3055
    ]
