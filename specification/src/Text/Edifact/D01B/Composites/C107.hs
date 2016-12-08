{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Composites.C107
  ( -- * Definition
    compositeC107
    -- * Dependencies
  , simple1131
  , simple3055
  , simple4441
  ) where

import           Text.Edifact.D01B.Simples (simple1131, simple3055, simple4441)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >        C107 TEXT REFERENCE
-- >
-- >        Desc: Coded reference to a standard text and its source.
-- >
-- > 010    4441  Free text value code                      M      an..17
-- > 020    1131  Code list identification code             C      an..17
-- > 030    3055  Code list responsible agency code         C      an..3
--
-- Dependencies: 'simple1131', 'simple3055', 'simple4441'.
compositeC107 :: Parser Value
compositeC107 =
  composite "C107"
    [ "010" .@ mandatory simple4441
    , "020" .@ optional  simple1131
    , "030" .@ optional  simple3055
    ]
