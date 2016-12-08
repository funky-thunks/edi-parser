{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Segments.CNI
  ( -- * Definition
    segmentCNI
    -- * Dependencies
  , compositeC503
  , simple1312
  , simple1490
  ) where

import           Text.Edifact.D01B.Composites (compositeC503)
import           Text.Edifact.D01B.Simples    (simple1312, simple1490)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >        CNI  CONSIGNMENT INFORMATION
-- >
-- >        Function: To identify one consignment.
-- >
-- > 010    1490 CONSOLIDATION ITEM NUMBER                  C    1 n..4
-- >
-- > 020    C503 DOCUMENT/MESSAGE DETAILS                   C    1
-- >        1004  Document identifier                       C      an..35
-- >        1373  Document status code                      C      an..3
-- >        1366  Document source description               C      an..70
-- >        3453  Language name code                        C      an..3
-- >        1056  Version identifier                        C      an..9
-- >        1060  Revision identifier                       C      an..6
-- >
-- > 030    1312 CONSIGNMENT LOAD SEQUENCE IDENTIFIER       C    1 n..4
--
-- Dependencies: 'compositeC503', 'simple1312', 'simple1490'.
segmentCNI :: Parser Value
segmentCNI =
  segment "CNI"
    [ "010" .@ optional  simple1490
    , "020" .@ optional  compositeC503
    , "030" .@ optional  simple1312
    ]
