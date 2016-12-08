{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Segments.DOC
  ( -- * Definition
    segmentDOC
    -- * Dependencies
  , compositeC002
  , compositeC503
  , simple1218
  , simple1220
  , simple3153
  ) where

import           Text.Edifact.D96A.Composites (compositeC002, compositeC503)
import           Text.Edifact.D96A.Simples    (simple1218, simple1220,
                                               simple3153)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >       DOC    DOCUMENT/MESSAGE DETAILS
-- >
-- >       Function: To identify documents, either printed, electronically
-- >                 transferred, or referenced as specified in message
-- >                 description, including, where relevant, the
-- >                 identification of the type of transaction that will
-- >                 result from this message.
-- >
-- > 010   C002  DOCUMENT/MESSAGE NAME                          M
-- >       1001   Document/message name, coded                  C  an..3
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
-- >       1000   Document/message name                         C  an..35
-- >
-- > 020   C503  DOCUMENT/MESSAGE DETAILS                       C
-- >       1004   Document/message number                       C  an..35
-- >       1373   Document/message status, coded                C  an..3
-- >       1366   Document/message source                       C  an..35
-- >       3453   Language, coded                               C  an..3
-- >
-- > 030   3153  COMMUNICATION CHANNEL IDENTIFIER, CODED        C  an..3
-- >
-- > 040   1220  NUMBER OF COPIES OF DOCUMENT REQUIRED          C  n..2
-- >
-- > 050   1218  NUMBER OF ORIGINALS OF DOCUMENT REQUIRED       C  n..2
--
-- Dependencies: 'compositeC002', 'compositeC503', 'simple1218', 'simple1220', 'simple3153'.
segmentDOC :: Parser Value
segmentDOC =
  segment "DOC"
    [ "010" .@ mandatory compositeC002
    , "020" .@ optional  compositeC503
    , "030" .@ optional  simple3153
    , "040" .@ optional  simple1220
    , "050" .@ optional  simple1218
    ]
