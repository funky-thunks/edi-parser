{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Segments.MOA
  ( -- * Definition
    segmentMOA
    -- * Dependencies
  , compositeC516
  ) where

import           Text.Edifact.D01B.Composites (compositeC516)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >        MOA  MONETARY AMOUNT
-- >
-- >        Function: To specify a monetary amount.
-- >
-- > 010    C516 MONETARY AMOUNT                            M    1
-- >        5025  Monetary amount type code qualifier       M      an..3
-- >        5004  Monetary amount                           C      n..35
-- >        6345  Currency identification code              C      an..3
-- >        6343  Currency type code qualifier              C      an..3
-- >        4405  Status description code                   C      an..3
--
-- Dependencies: 'compositeC516'.
segmentMOA :: Parser Value
segmentMOA =
  segment "MOA"
    [ "010" .@ mandatory compositeC516
    ]
