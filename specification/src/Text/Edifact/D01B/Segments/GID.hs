{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Segments.GID
  ( -- * Definition
    segmentGID
    -- * Dependencies
  , compositeC213
  , simple1496
  ) where

import           Text.Edifact.D01B.Composites (compositeC213)
import           Text.Edifact.D01B.Simples    (simple1496)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >        GID  GOODS ITEM DETAILS
-- >
-- >        Function: To indicate totals of a goods item.
-- >
-- > 010    1496 GOODS ITEM NUMBER                          C    1 n..5
-- >
-- > 020    C213 NUMBER AND TYPE OF PACKAGES                C    1
-- >        7224  Package quantity                          C      n..8
-- >        7065  Package type description code             C      an..17
-- >        1131  Code list identification code             C      an..17
-- >        3055  Code list responsible agency code         C      an..3
-- >        7064  Type of packages                          C      an..35
-- >        7233  Packaging related description code        C      an..3
-- >
-- > 030    C213 NUMBER AND TYPE OF PACKAGES                C    1
-- >        7224  Package quantity                          C      n..8
-- >        7065  Package type description code             C      an..17
-- >        1131  Code list identification code             C      an..17
-- >        3055  Code list responsible agency code         C      an..3
-- >        7064  Type of packages                          C      an..35
-- >        7233  Packaging related description code        C      an..3
-- >
-- > 040    C213 NUMBER AND TYPE OF PACKAGES                C    1
-- >        7224  Package quantity                          C      n..8
-- >        7065  Package type description code             C      an..17
-- >        1131  Code list identification code             C      an..17
-- >        3055  Code list responsible agency code         C      an..3
-- >        7064  Type of packages                          C      an..35
-- >        7233  Packaging related description code        C      an..3
-- >
-- > 050    C213 NUMBER AND TYPE OF PACKAGES                C    1
-- >        7224  Package quantity                          C      n..8
-- >        7065  Package type description code             C      an..17
-- >        1131  Code list identification code             C      an..17
-- >        3055  Code list responsible agency code         C      an..3
-- >        7064  Type of packages                          C      an..35
-- >        7233  Packaging related description code        C      an..3
-- >
-- > 060    C213 NUMBER AND TYPE OF PACKAGES                C    1
-- >        7224  Package quantity                          C      n..8
-- >        7065  Package type description code             C      an..17
-- >        1131  Code list identification code             C      an..17
-- >        3055  Code list responsible agency code         C      an..3
-- >        7064  Type of packages                          C      an..35
-- >        7233  Packaging related description code        C      an..3
--
-- Dependencies: 'compositeC213', 'simple1496'.
segmentGID :: Parser Value
segmentGID =
  segment "GID"
    [ "010" .@ optional  simple1496
    , "020" .@ optional  compositeC213
    , "030" .@ optional  compositeC213
    , "040" .@ optional  compositeC213
    , "050" .@ optional  compositeC213
    , "060" .@ optional  compositeC213
    ]
