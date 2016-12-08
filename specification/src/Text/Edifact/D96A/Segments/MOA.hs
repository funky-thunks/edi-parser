{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Segments.MOA
  ( -- * Definition
    segmentMOA
    -- * Dependencies
  , compositeC516
  ) where

import           Text.Edifact.D96A.Composites (compositeC516)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >       MOA    MONETARY AMOUNT
-- >
-- >       Function: To specify a monetary amount.
-- >
-- > 010   C516  MONETARY AMOUNT                                M
-- >       5025   Monetary amount type qualifier                M  an..3
-- >       5004   Monetary amount                               C  n..18
-- >       6345   Currency, coded                               C  an..3
-- >       6343   Currency qualifier                            C  an..3
-- >       4405   Status, coded                                 C  an..3
--
-- Dependencies: 'compositeC516'.
segmentMOA :: Parser Value
segmentMOA =
  segment "MOA"
    [ "010" .@ mandatory compositeC516
    ]
