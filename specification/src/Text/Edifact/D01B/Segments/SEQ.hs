{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Segments.SEQ
  ( -- * Definition
    segmentSEQ
    -- * Dependencies
  , compositeC286
  , simple1229
  ) where

import           Text.Edifact.D01B.Composites (compositeC286)
import           Text.Edifact.D01B.Simples    (simple1229)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >        SEQ  SEQUENCE DETAILS
-- >
-- >        Function: To provide details relating to the sequence.
-- >
-- > 010    1229 ACTION REQUEST/NOTIFICATION DESCRIPTION
-- >             CODE                                       C    1 an..3
-- >
-- > 020    C286 SEQUENCE INFORMATION                       C    1
-- >        1050  Sequence position identifier              M      an..10
-- >        1159  Sequence identifier source code           C      an..3
-- >        1131  Code list identification code             C      an..17
-- >        3055  Code list responsible agency code         C      an..3
--
-- Dependencies: 'compositeC286', 'simple1229'.
segmentSEQ :: Parser Value
segmentSEQ =
  segment "SEQ"
    [ "010" .@ optional  simple1229
    , "020" .@ optional  compositeC286
    ]
