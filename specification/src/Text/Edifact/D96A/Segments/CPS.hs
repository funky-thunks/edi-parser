{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Segments.CPS
  ( -- * Definition
    segmentCPS
    -- * Dependencies
  , simple7075
  , simple7164
  , simple7166
  ) where

import           Text.Edifact.D96A.Simples (simple7075, simple7164, simple7166)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       CPS    CONSIGNMENT PACKING SEQUENCE
-- >
-- >       Function: To identify the sequence in which physical packing is
-- >                 presented in the consignment, and optionally to
-- >                 identify the hierarchical relationship between packing
-- >                 layers.
-- >
-- > 010   7164  HIERARCHICAL ID. NUMBER                        M  an..12
-- >
-- > 020   7166  HIERARCHICAL PARENT ID.                        C  an..12
-- >
-- > 030   7075  PACKAGING LEVEL, CODED                         C  an..3
--
-- Dependencies: 'simple7075', 'simple7164', 'simple7166'.
segmentCPS :: Parser Value
segmentCPS =
  segment "CPS"
    [ "010" .@ mandatory simple7164
    , "020" .@ optional  simple7166
    , "030" .@ optional  simple7075
    ]
