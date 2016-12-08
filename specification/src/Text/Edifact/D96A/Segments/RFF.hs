{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Segments.RFF
  ( -- * Definition
    segmentRFF
    -- * Dependencies
  , compositeC506
  ) where

import           Text.Edifact.D96A.Composites (compositeC506)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >       RFF    REFERENCE
-- >
-- >       Function: To specify a reference.
-- >
-- > 010   C506  REFERENCE                                      M
-- >       1153   Reference qualifier                           M  an..3
-- >       1154   Reference number                              C  an..35
-- >       1156   Line number                                   C  an..6
-- >       4000   Reference version number                      C  an..35
--
-- Dependencies: 'compositeC506'.
segmentRFF :: Parser Value
segmentRFF =
  segment "RFF"
    [ "010" .@ mandatory compositeC506
    ]
