{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Segments.DOC
  ( -- * Definition
    segmentDOC
    -- * Dependencies
  , compositeC002
  , compositeC503
  , simple1218
  , simple1220
  , simple3153
  ) where

import           Text.Edifact.D01B.Composites (compositeC002, compositeC503)
import           Text.Edifact.D01B.Simples    (simple1218, simple1220,
                                               simple3153)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >        DOC  DOCUMENT/MESSAGE DETAILS
-- >
-- >        Function: To identify documents and details directly
-- >                  related to it.
-- >
-- > 010    C002 DOCUMENT/MESSAGE NAME                      M    1
-- >        1001  Document name code                        C      an..3
-- >        1131  Code list identification code             C      an..17
-- >        3055  Code list responsible agency code         C      an..3
-- >        1000  Document name                             C      an..35
-- >
-- > 020    C503 DOCUMENT/MESSAGE DETAILS                   C    1
-- >        1004  Document identifier                       C      an..35
-- >        1373  Document status code                      C      an..3
-- >        1366  Document source description               C      an..70
-- >        3453  Language name code                        C      an..3
-- >        1056  Version identifier                        C      an..9
-- >        1060  Revision identifier                       C      an..6
-- >
-- > 030    3153 COMMUNICATION MEDIUM TYPE CODE             C    1 an..3
-- >
-- > 040    1220 DOCUMENT COPIES REQUIRED QUANTITY          C    1 n..2
-- >
-- > 050    1218 DOCUMENT ORIGINALS REQUIRED QUANTITY       C    1 n..2
--
-- Dependencies: 'compositeC002', 'compositeC503', 'simple1218', 'simple1220', 'simple3153'.
segmentDOC :: Parser Value
segmentDOC =
  segment "DOC"
    [ "010" .@ mandatory compositeC002
    , "020" .@ optional  compositeC503
    , "030" .@ optional  simple3153
    , "040" .@ optional  simple1220
    , "050" .@ optional  simple1218
    ]
