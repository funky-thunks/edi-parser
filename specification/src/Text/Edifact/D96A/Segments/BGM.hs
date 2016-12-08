{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Segments.BGM
  ( -- * Definition
    segmentBGM
    -- * Dependencies
  , compositeC002
  , simple1004
  , simple1225
  , simple4343
  ) where

import           Text.Edifact.D96A.Composites (compositeC002)
import           Text.Edifact.D96A.Simples    (simple1004, simple1225,
                                               simple4343)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >       BGM    BEGINNING OF MESSAGE
-- >
-- >       Function: To indicate the type and function of a message and to
-- >                 transmit the identifying number.
-- >
-- > 010   C002  DOCUMENT/MESSAGE NAME                          C
-- >       1001   Document/message name, coded                  C  an..3
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
-- >       1000   Document/message name                         C  an..35
-- >
-- > 020   1004  DOCUMENT/MESSAGE NUMBER                        C  an..35
-- >
-- > 030   1225  MESSAGE FUNCTION, CODED                        C  an..3
-- >
-- > 040   4343  RESPONSE TYPE, CODED                           C  an..3
--
-- Dependencies: 'compositeC002', 'simple1004', 'simple1225', 'simple4343'.
segmentBGM :: Parser Value
segmentBGM =
  segment "BGM"
    [ "010" .@ optional  compositeC002
    , "020" .@ optional  simple1004
    , "030" .@ optional  simple1225
    , "040" .@ optional  simple4343
    ]
