{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Composites.C059
  ( -- * Definition
    compositeC059
    -- * Dependencies
  , simple3042
  ) where

import           Text.Edifact.D01B.Simples (simple3042)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >        C059 STREET
-- >
-- >        Desc: Street address and/or PO Box number in a structured
-- >              address: one to four lines.
-- >
-- > 010    3042  Street and number or post office box
-- >              identifier                                M      an..35
-- > 020    3042  Street and number or post office box
-- >              identifier                                C      an..35
-- > 030    3042  Street and number or post office box
-- >              identifier                                C      an..35
-- > 040    3042  Street and number or post office box
-- >              identifier                                C      an..35
--
-- Dependencies: 'simple3042'.
compositeC059 :: Parser Value
compositeC059 =
  composite "C059"
    [ "010" .@ mandatory simple3042
    , "020" .@ optional  simple3042
    , "030" .@ optional  simple3042
    , "040" .@ optional  simple3042
    ]
