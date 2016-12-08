{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Composites.C537
  ( -- * Definition
    compositeC537
    -- * Dependencies
  , simple1131
  , simple3055
  , simple4219
  ) where

import           Text.Edifact.D01B.Simples (simple1131, simple3055, simple4219)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >        C537 TRANSPORT PRIORITY
-- >
-- >        Desc: To indicate the priority of requested transport
-- >              service.
-- >
-- > 010    4219  Transport service priority code           M      an..3
-- > 020    1131  Code list identification code             C      an..17
-- > 030    3055  Code list responsible agency code         C      an..3
--
-- Dependencies: 'simple1131', 'simple3055', 'simple4219'.
compositeC537 :: Parser Value
compositeC537 =
  composite "C537"
    [ "010" .@ mandatory simple4219
    , "020" .@ optional  simple1131
    , "030" .@ optional  simple3055
    ]
