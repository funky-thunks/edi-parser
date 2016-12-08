{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Composites.C002
  ( -- * Definition
    compositeC002
    -- * Dependencies
  , simple1000
  , simple1001
  , simple1131
  , simple3055
  ) where

import           Text.Edifact.D01B.Simples (simple1000, simple1001, simple1131,
                                            simple3055)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >        C002 DOCUMENT/MESSAGE NAME
-- >
-- >        Desc: Identification of a type of document/message by code
-- >              or name. Code preferred.
-- >
-- > 010    1001  Document name code                        C      an..3
-- > 020    1131  Code list identification code             C      an..17
-- > 030    3055  Code list responsible agency code         C      an..3
-- > 040    1000  Document name                             C      an..35
--
-- Dependencies: 'simple1000', 'simple1001', 'simple1131', 'simple3055'.
compositeC002 :: Parser Value
compositeC002 =
  composite "C002"
    [ "010" .@ optional  simple1001
    , "020" .@ optional  simple1131
    , "030" .@ optional  simple3055
    , "040" .@ optional  simple1000
    ]
