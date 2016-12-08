{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Segments.SGP
  ( -- * Definition
    segmentSGP
    -- * Dependencies
  , compositeC237
  , simple7224
  ) where

import           Text.Edifact.D96A.Composites (compositeC237)
import           Text.Edifact.D96A.Simples    (simple7224)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >       SGP    SPLIT GOODS PLACEMENT
-- >
-- >       Function: To specify the placement of goods in relation to
-- >                 equipment.
-- >
-- > 010   C237  EQUIPMENT IDENTIFICATION                       M
-- >       8260   Equipment identification number               C  an..17
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
-- >       3207   Country, coded                                C  an..3
-- >
-- > 020   7224  NUMBER OF PACKAGES                             C  n..8
--
-- Dependencies: 'compositeC237', 'simple7224'.
segmentSGP :: Parser Value
segmentSGP =
  segment "SGP"
    [ "010" .@ mandatory compositeC237
    , "020" .@ optional  simple7224
    ]
