{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Segments.GIR
  ( -- * Definition
    segmentGIR
    -- * Dependencies
  , compositeC206
  , simple7297
  ) where

import           Text.Edifact.D96A.Composites (compositeC206)
import           Text.Edifact.D96A.Simples    (simple7297)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >       GIR    RELATED IDENTIFICATION NUMBERS
-- >
-- >       Function: To specify a related set of identification numbers.
-- >
-- > 010   7297  SET IDENTIFICATION QUALIFIER                   M  an..3
-- >
-- > 020   C206  IDENTIFICATION NUMBER                          M
-- >       7402   Identity number                               M  an..35
-- >       7405   Identity number qualifier                     C  an..3
-- >       4405   Status, coded                                 C  an..3
-- >
-- > 030   C206  IDENTIFICATION NUMBER                          C
-- >       7402   Identity number                               M  an..35
-- >       7405   Identity number qualifier                     C  an..3
-- >       4405   Status, coded                                 C  an..3
-- >
-- > 040   C206  IDENTIFICATION NUMBER                          C
-- >       7402   Identity number                               M  an..35
-- >       7405   Identity number qualifier                     C  an..3
-- >       4405   Status, coded                                 C  an..3
-- >
-- > 050   C206  IDENTIFICATION NUMBER                          C
-- >       7402   Identity number                               M  an..35
-- >       7405   Identity number qualifier                     C  an..3
-- >       4405   Status, coded                                 C  an..3
-- >
-- > 060   C206  IDENTIFICATION NUMBER                          C
-- >       7402   Identity number                               M  an..35
-- >       7405   Identity number qualifier                     C  an..3
-- >       4405   Status, coded                                 C  an..3
--
-- Dependencies: 'compositeC206', 'simple7297'.
segmentGIR :: Parser Value
segmentGIR =
  segment "GIR"
    [ "010" .@ mandatory simple7297
    , "020" .@ mandatory compositeC206
    , "030" .@ optional  compositeC206
    , "040" .@ optional  compositeC206
    , "050" .@ optional  compositeC206
    , "060" .@ optional  compositeC206
    ]
