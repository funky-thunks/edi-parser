{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Segments.DIM
  ( -- * Definition
    segmentDIM
    -- * Dependencies
  , compositeC211
  , simple6145
  ) where

import           Text.Edifact.D01B.Composites (compositeC211)
import           Text.Edifact.D01B.Simples    (simple6145)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >        DIM  DIMENSIONS
-- >
-- >        Function: To specify dimensions.
-- >
-- > 010    6145 DIMENSION TYPE CODE QUALIFIER              M    1 an..3
-- >
-- > 020    C211 DIMENSIONS                                 M    1
-- >        6411  Measurement unit code                     M      an..3
-- >        6168  Length dimension value                    C      n..15
-- >        6140  Width dimension value                     C      n..15
-- >        6008  Height dimension value                    C      n..15
--
-- Dependencies: 'compositeC211', 'simple6145'.
segmentDIM :: Parser Value
segmentDIM =
  segment "DIM"
    [ "010" .@ mandatory simple6145
    , "020" .@ mandatory compositeC211
    ]
