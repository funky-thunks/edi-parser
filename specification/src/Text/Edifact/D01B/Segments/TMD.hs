{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Segments.TMD
  ( -- * Definition
    segmentTMD
    -- * Dependencies
  , compositeC219
  , simple8332
  , simple8341
  ) where

import           Text.Edifact.D01B.Composites (compositeC219)
import           Text.Edifact.D01B.Simples    (simple8332, simple8341)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >        TMD  TRANSPORT MOVEMENT DETAILS
-- >
-- >        Function: To specify operational transport movement
-- >                  details for a goods item or equipment (which may
-- >                  differ from the contractual conditions).
-- >
-- > 010    C219 MOVEMENT TYPE                              C    1
-- >        8335  Movement type description code            C      an..3
-- >        8334  Movement type description                 C      an..35
-- >
-- > 020    8332 EQUIPMENT PLAN DESCRIPTION                 C    1 an..26
-- >
-- > 030    8341 HAULAGE ARRANGEMENTS CODE                  C    1 an..3
--
-- Dependencies: 'compositeC219', 'simple8332', 'simple8341'.
segmentTMD :: Parser Value
segmentTMD =
  segment "TMD"
    [ "010" .@ optional  compositeC219
    , "020" .@ optional  simple8332
    , "030" .@ optional  simple8341
    ]
