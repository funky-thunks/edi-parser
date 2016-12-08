{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Segments.QTY
  ( -- * Definition
    segmentQTY
    -- * Dependencies
  , compositeC186
  ) where

import           Text.Edifact.D96A.Composites (compositeC186)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >       QTY    QUANTITY
-- >
-- >       Function: To specify a pertinent quantity.
-- >
-- > 010   C186  QUANTITY DETAILS                               M
-- >       6063   Quantity qualifier                            M  an..3
-- >       6060   Quantity                                      M  n..15
-- >       6411   Measure unit qualifier                        C  an..3
--
-- Dependencies: 'compositeC186'.
segmentQTY :: Parser Value
segmentQTY =
  segment "QTY"
    [ "010" .@ mandatory compositeC186
    ]
