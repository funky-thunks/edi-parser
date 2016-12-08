{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Segments.DIM
  ( -- * Definition
    segmentDIM
    -- * Dependencies
  , compositeC211
  , simple6145
  ) where

import           Text.Edifact.D96A.Composites (compositeC211)
import           Text.Edifact.D96A.Simples    (simple6145)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >       DIM    DIMENSIONS
-- >
-- >       Function: To specify dimensions.
-- >
-- > 010   6145  DIMENSION QUALIFIER                            M  an..3
-- >
-- > 020   C211  DIMENSIONS                                     M
-- >       6411   Measure unit qualifier                        M  an..3
-- >       6168   Length dimension                              C  n..15
-- >       6140   Width dimension                               C  n..15
-- >       6008   Height dimension                              C  n..15
--
-- Dependencies: 'compositeC211', 'simple6145'.
segmentDIM :: Parser Value
segmentDIM =
  segment "DIM"
    [ "010" .@ mandatory simple6145
    , "020" .@ mandatory compositeC211
    ]
