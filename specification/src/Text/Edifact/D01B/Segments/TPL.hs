{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Segments.TPL
  ( -- * Definition
    segmentTPL
    -- * Dependencies
  , compositeC222
  ) where

import           Text.Edifact.D01B.Composites (compositeC222)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >        TPL  TRANSPORT PLACEMENT
-- >
-- >        Function: To specify placement of goods or equipment in
-- >                  relation to the transport used. The segment
-- >                  serves as a pointer to the TDT segment group.
-- >
-- > 010    C222 TRANSPORT IDENTIFICATION                   M    1
-- >        8213  Transport means identification name
-- >              identifier                                C      an..9
-- >        1131  Code list identification code             C      an..17
-- >        3055  Code list responsible agency code         C      an..3
-- >        8212  Transport means identification name       C      an..35
-- >        8453  Transport means nationality code          C      an..3
--
-- Dependencies: 'compositeC222'.
segmentTPL :: Parser Value
segmentTPL =
  segment "TPL"
    [ "010" .@ mandatory compositeC222
    ]
