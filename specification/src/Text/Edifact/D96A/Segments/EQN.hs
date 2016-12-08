{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Segments.EQN
  ( -- * Definition
    segmentEQN
    -- * Dependencies
  , compositeC523
  ) where

import           Text.Edifact.D96A.Composites (compositeC523)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >       EQN    NUMBER OF UNITS
-- >
-- >       Function: To specify the number of units.
-- >
-- > 010   C523  NUMBER OF UNIT DETAILS                         M
-- >       6350   Number of units                               C  n..15
-- >       6353   Number of units qualifier                     C  an..3
--
-- Dependencies: 'compositeC523'.
segmentEQN :: Parser Value
segmentEQN =
  segment "EQN"
    [ "010" .@ mandatory compositeC523
    ]
