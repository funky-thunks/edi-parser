{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Segments.GDS
  ( -- * Definition
    segmentGDS
    -- * Dependencies
  , compositeC703
  ) where

import           Text.Edifact.D01B.Composites (compositeC703)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >        GDS  NATURE OF CARGO
-- >
-- >        Function: To indicate the type of cargo as a general
-- >                  classification.
-- >
-- > 010    C703 NATURE OF CARGO                            C    1
-- >        7085  Cargo type classification code            M      an..3
-- >        1131  Code list identification code             C      an..17
-- >        3055  Code list responsible agency code         C      an..3
--
-- Dependencies: 'compositeC703'.
segmentGDS :: Parser Value
segmentGDS =
  segment "GDS"
    [ "010" .@ optional  compositeC703
    ]
