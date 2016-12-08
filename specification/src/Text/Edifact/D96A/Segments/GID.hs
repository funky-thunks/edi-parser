{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Segments.GID
  ( -- * Definition
    segmentGID
    -- * Dependencies
  , compositeC213
  , simple1496
  ) where

import           Text.Edifact.D96A.Composites (compositeC213)
import           Text.Edifact.D96A.Simples    (simple1496)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >       GID    GOODS ITEM DETAILS
-- >
-- >       Function: To indicate totals of a goods item.
-- >
-- > 010   1496  GOODS ITEM NUMBER                              C  n..5
-- >
-- > 020   C213  NUMBER AND TYPE OF PACKAGES                    C
-- >       7224   Number of packages                            C  n..8
-- >       7065   Type of packages identification               C  an..17
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
-- >       7064   Type of packages                              C  an..35
-- >
-- > 030   C213  NUMBER AND TYPE OF PACKAGES                    C
-- >       7224   Number of packages                            C  n..8
-- >       7065   Type of packages identification               C  an..17
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
-- >       7064   Type of packages                              C  an..35
-- >
-- > 040   C213  NUMBER AND TYPE OF PACKAGES                    C
-- >       7224   Number of packages                            C  n..8
-- >       7065   Type of packages identification               C  an..17
-- >       1131   Code list qualifier                           C  an..3
-- >       3055   Code list responsible agency, coded           C  an..3
-- >       7064   Type of packages                              C  an..35
--
-- Dependencies: 'compositeC213', 'simple1496'.
segmentGID :: Parser Value
segmentGID =
  segment "GID"
    [ "010" .@ optional  simple1496
    , "020" .@ optional  compositeC213
    , "030" .@ optional  compositeC213
    , "040" .@ optional  compositeC213
    ]
