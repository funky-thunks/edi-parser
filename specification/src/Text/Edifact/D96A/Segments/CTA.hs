{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Segments.CTA
  ( -- * Definition
    segmentCTA
    -- * Dependencies
  , compositeC056
  , simple3139
  ) where

import           Text.Edifact.D96A.Composites (compositeC056)
import           Text.Edifact.D96A.Simples    (simple3139)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >       CTA    CONTACT INFORMATION
-- >
-- >       Function: To identify a person or a department to whom
-- >                 communication should be directed.
-- >
-- > 010   3139  CONTACT FUNCTION, CODED                        C  an..3
-- >
-- > 020   C056  DEPARTMENT OR EMPLOYEE DETAILS                 C
-- >       3413   Department or employee identification         C  an..17
-- >       3412   Department or employee                        C  an..35
--
-- Dependencies: 'compositeC056', 'simple3139'.
segmentCTA :: Parser Value
segmentCTA =
  segment "CTA"
    [ "010" .@ optional  simple3139
    , "020" .@ optional  compositeC056
    ]
