{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Segments.CNI
  ( -- * Definition
    segmentCNI
    -- * Dependencies
  , compositeC503
  , simple1312
  , simple1490
  ) where

import           Text.Edifact.D96A.Composites (compositeC503)
import           Text.Edifact.D96A.Simples    (simple1312, simple1490)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >       CNI    CONSIGNMENT INFORMATION
-- >
-- >       Function: To identify one consignment.
-- >
-- > 010   1490  CONSOLIDATION ITEM NUMBER                      C  n..4
-- >
-- > 020   C503  DOCUMENT/MESSAGE DETAILS                       C
-- >       1004   Document/message number                       C  an..35
-- >       1373   Document/message status, coded                C  an..3
-- >       1366   Document/message source                       C  an..35
-- >       3453   Language, coded                               C  an..3
-- >
-- > 030   1312  CONSIGNMENT LOAD SEQUENCE NUMBER               C  n..4
--
-- Dependencies: 'compositeC503', 'simple1312', 'simple1490'.
segmentCNI :: Parser Value
segmentCNI =
  segment "CNI"
    [ "010" .@ optional  simple1490
    , "020" .@ optional  compositeC503
    , "030" .@ optional  simple1312
    ]
