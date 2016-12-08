{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Segments.EQA
  ( -- * Definition
    segmentEQA
    -- * Dependencies
  , compositeC237
  , simple8053
  ) where

import           Text.Edifact.D96A.Composites (compositeC237)
import           Text.Edifact.D96A.Simples    (simple8053)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >       EQA    ATTACHED EQUIPMENT
-- >
-- >       Function: To specify attached or related equipment.
-- >
-- > 010   8053  EQUIPMENT QUALIFIER                            M  an..3
-- >
-- > 020   C237  EQUIPMENT IDENTIFICATION                       C
-- >       8260   Equipment identification number               C  an..17
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
-- >       3207   Country, coded                                C  an..3
--
-- Dependencies: 'compositeC237', 'simple8053'.
segmentEQA :: Parser Value
segmentEQA =
  segment "EQA"
    [ "010" .@ mandatory simple8053
    , "020" .@ optional  compositeC237
    ]
