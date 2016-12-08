{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Segments.EQD
  ( -- * Definition
    segmentEQD
    -- * Dependencies
  , compositeC224
  , compositeC237
  , simple8053
  , simple8077
  , simple8169
  , simple8249
  ) where

import           Text.Edifact.D01B.Composites (compositeC224, compositeC237)
import           Text.Edifact.D01B.Simples    (simple8053, simple8077,
                                               simple8169, simple8249)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >        EQD  EQUIPMENT DETAILS
-- >
-- >        Function: To identify a unit of equipment.
-- >
-- > 010    8053 EQUIPMENT TYPE CODE QUALIFIER              M    1 an..3
-- >
-- > 020    C237 EQUIPMENT IDENTIFICATION                   C    1
-- >        8260  Equipment identifier                      C      an..17
-- >        1131  Code list identification code             C      an..17
-- >        3055  Code list responsible agency code         C      an..3
-- >        3207  Country name code                         C      an..3
-- >
-- > 030    C224 EQUIPMENT SIZE AND TYPE                    C    1
-- >        8155  Equipment size and type description code  C      an..10
-- >        1131  Code list identification code             C      an..17
-- >        3055  Code list responsible agency code         C      an..3
-- >        8154  Equipment size and type description       C      an..35
-- >
-- > 040    8077 EQUIPMENT SUPPLIER CODE                    C    1 an..3
-- >
-- > 050    8249 EQUIPMENT STATUS CODE                      C    1 an..3
-- >
-- > 060    8169 FULL OR EMPTY INDICATOR CODE               C    1 an..3
--
-- Dependencies: 'compositeC224', 'compositeC237', 'simple8053', 'simple8077', 'simple8169', 'simple8249'.
segmentEQD :: Parser Value
segmentEQD =
  segment "EQD"
    [ "010" .@ mandatory simple8053
    , "020" .@ optional  compositeC237
    , "030" .@ optional  compositeC224
    , "040" .@ optional  simple8077
    , "050" .@ optional  simple8249
    , "060" .@ optional  simple8169
    ]
