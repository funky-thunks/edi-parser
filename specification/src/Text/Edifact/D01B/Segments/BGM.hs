{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Segments.BGM
  ( -- * Definition
    segmentBGM
    -- * Dependencies
  , compositeC002
  , compositeC106
  , simple1225
  , simple4343
  ) where

import           Text.Edifact.D01B.Composites (compositeC002, compositeC106)
import           Text.Edifact.D01B.Simples    (simple1225, simple4343)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >        BGM  BEGINNING OF MESSAGE
-- >
-- >        Function: To indicate the type and function of a message
-- >                  and to transmit the identifying number.
-- >
-- > 010    C002 DOCUMENT/MESSAGE NAME                      C    1
-- >        1001  Document name code                        C      an..3
-- >        1131  Code list identification code             C      an..17
-- >        3055  Code list responsible agency code         C      an..3
-- >        1000  Document name                             C      an..35
-- >
-- > 020    C106 DOCUMENT/MESSAGE IDENTIFICATION            C    1
-- >        1004  Document identifier                       C      an..35
-- >        1056  Version identifier                        C      an..9
-- >        1060  Revision identifier                       C      an..6
-- >
-- > 030    1225 MESSAGE FUNCTION CODE                      C    1 an..3
-- >
-- > 040    4343 RESPONSE TYPE CODE                         C    1 an..3
--
-- Dependencies: 'compositeC002', 'compositeC106', 'simple1225', 'simple4343'.
segmentBGM :: Parser Value
segmentBGM =
  segment "BGM"
    [ "010" .@ optional  compositeC002
    , "020" .@ optional  compositeC106
    , "030" .@ optional  simple1225
    , "040" .@ optional  simple4343
    ]
