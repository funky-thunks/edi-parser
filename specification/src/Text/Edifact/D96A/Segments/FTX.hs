{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Segments.FTX
  ( -- * Definition
    segmentFTX
    -- * Dependencies
  , compositeC107
  , compositeC108
  , simple3453
  , simple4451
  , simple4453
  ) where

import           Text.Edifact.D96A.Composites (compositeC107, compositeC108)
import           Text.Edifact.D96A.Simples    (simple3453, simple4451,
                                               simple4453)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >       FTX    FREE TEXT
-- >
-- >       Function: To provide free form or coded text information.
-- >
-- > 010   4451  TEXT SUBJECT QUALIFIER                         M  an..3
-- >
-- > 020   4453  TEXT FUNCTION, CODED                           C  an..3
-- >
-- > 030   C107  TEXT REFERENCE                                 C
-- >       4441   Free text, coded                              M  an..3
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
-- >
-- > 040   C108  TEXT LITERAL                                   C
-- >       4440   Free text                                     M  an..70
-- >       4440   Free text                                     C  an..70
-- >       4440   Free text                                     C  an..70
-- >       4440   Free text                                     C  an..70
-- >       4440   Free text                                     C  an..70
-- >
-- > 050   3453  LANGUAGE, CODED                                C  an..3
--
-- Dependencies: 'compositeC107', 'compositeC108', 'simple3453', 'simple4451', 'simple4453'.
segmentFTX :: Parser Value
segmentFTX =
  segment "FTX"
    [ "010" .@ mandatory simple4451
    , "020" .@ optional  simple4453
    , "030" .@ optional  compositeC107
    , "040" .@ optional  compositeC108
    , "050" .@ optional  simple3453
    ]
