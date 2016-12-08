{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Composites.C106
  ( -- * Definition
    compositeC106
    -- * Dependencies
  , simple1004
  , simple1056
  , simple1060
  ) where

import           Text.Edifact.D01B.Simples (simple1004, simple1056, simple1060)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >        C106 DOCUMENT/MESSAGE IDENTIFICATION
-- >
-- >        Desc: Identification of a document/message by its number
-- >              and eventually its version or revision.
-- >
-- > 010    1004  Document identifier                       C      an..35
-- > 020    1056  Version identifier                        C      an..9
-- > 030    1060  Revision identifier                       C      an..6
--
-- Dependencies: 'simple1004', 'simple1056', 'simple1060'.
compositeC106 :: Parser Value
compositeC106 =
  composite "C106"
    [ "010" .@ optional  simple1004
    , "020" .@ optional  simple1056
    , "030" .@ optional  simple1060
    ]
