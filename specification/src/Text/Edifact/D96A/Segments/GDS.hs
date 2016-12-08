{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Segments.GDS
  ( -- * Definition
    segmentGDS
    -- * Dependencies
  , compositeC703
  ) where

import           Text.Edifact.D96A.Composites (compositeC703)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >       GDS    NATURE OF CARGO
-- >
-- >       Function: To indicate the type of cargo as a general
-- >                 classification.
-- >
-- > 010   C703  NATURE OF CARGO                                C
-- >       7085   Nature of cargo, coded                        M  an..3
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
--
-- Dependencies: 'compositeC703'.
segmentGDS :: Parser Value
segmentGDS =
  segment "GDS"
    [ "010" .@ optional  compositeC703
    ]
