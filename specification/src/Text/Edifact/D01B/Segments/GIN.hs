{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Segments.GIN
  ( -- * Definition
    segmentGIN
    -- * Dependencies
  , compositeC208
  , simple7405
  ) where

import           Text.Edifact.D01B.Composites (compositeC208)
import           Text.Edifact.D01B.Simples    (simple7405)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >        GIN  GOODS IDENTITY NUMBER
-- >
-- >        Function: To give specific identification numbers, either
-- >                  as single numbers or ranges.
-- >
-- > 010    7405 OBJECT IDENTIFICATION CODE QUALIFIER       M    1 an..3
-- >
-- > 020    C208 IDENTITY NUMBER RANGE                      M    1
-- >        7402  Object identifier                         M      an..35
-- >        7402  Object identifier                         C      an..35
-- >
-- > 030    C208 IDENTITY NUMBER RANGE                      C    1
-- >        7402  Object identifier                         M      an..35
-- >        7402  Object identifier                         C      an..35
-- >
-- > 040    C208 IDENTITY NUMBER RANGE                      C    1
-- >        7402  Object identifier                         M      an..35
-- >        7402  Object identifier                         C      an..35
-- >
-- > 050    C208 IDENTITY NUMBER RANGE                      C    1
-- >        7402  Object identifier                         M      an..35
-- >        7402  Object identifier                         C      an..35
-- >
-- > 060    C208 IDENTITY NUMBER RANGE                      C    1
-- >        7402  Object identifier                         M      an..35
-- >        7402  Object identifier                         C      an..35
--
-- Dependencies: 'compositeC208', 'simple7405'.
segmentGIN :: Parser Value
segmentGIN =
  segment "GIN"
    [ "010" .@ mandatory simple7405
    , "020" .@ mandatory compositeC208
    , "030" .@ optional  compositeC208
    , "040" .@ optional  compositeC208
    , "050" .@ optional  compositeC208
    , "060" .@ optional  compositeC208
    ]
