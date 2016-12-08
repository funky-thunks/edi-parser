{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Composites.C286
  ( -- * Definition
    compositeC286
    -- * Dependencies
  , simple1050
  , simple1131
  , simple1159
  , simple3055
  ) where

import           Text.Edifact.D01B.Simples (simple1050, simple1131, simple1159,
                                            simple3055)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >        C286 SEQUENCE INFORMATION
-- >
-- >        Desc: Identification of a sequence and source for
-- >              sequencing.
-- >
-- > 010    1050  Sequence position identifier              M      an..10
-- > 020    1159  Sequence identifier source code           C      an..3
-- > 030    1131  Code list identification code             C      an..17
-- > 040    3055  Code list responsible agency code         C      an..3
--
-- Dependencies: 'simple1050', 'simple1131', 'simple1159', 'simple3055'.
compositeC286 :: Parser Value
compositeC286 =
  composite "C286"
    [ "010" .@ mandatory simple1050
    , "020" .@ optional  simple1159
    , "030" .@ optional  simple1131
    , "040" .@ optional  simple3055
    ]
