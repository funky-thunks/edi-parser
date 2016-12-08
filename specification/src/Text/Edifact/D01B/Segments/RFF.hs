{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Segments.RFF
  ( -- * Definition
    segmentRFF
    -- * Dependencies
  , compositeC506
  ) where

import           Text.Edifact.D01B.Composites (compositeC506)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >        RFF  REFERENCE
-- >
-- >        Function: To specify a reference.
-- >
-- > 010    C506 REFERENCE                                  M    1
-- >        1153  Reference code qualifier                  M      an..3
-- >        1154  Reference identifier                      C      an..70
-- >        1156  Document line identifier                  C      an..6
-- >        4000  Reference version identifier              C      an..35
-- >        1060  Revision identifier                       C      an..6
--
-- Dependencies: 'compositeC506'.
segmentRFF :: Parser Value
segmentRFF =
  segment "RFF"
    [ "010" .@ mandatory compositeC506
    ]
