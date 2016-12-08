{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C503
  ( -- * Definition
    compositeC503
    -- * Dependencies
  , simple1004
  , simple1366
  , simple1373
  , simple3453
  ) where

import           Text.Edifact.D96A.Simples (simple1004, simple1366, simple1373,
                                            simple3453)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C503  DOCUMENT/MESSAGE DETAILS
-- >
-- >       Desc: Identification of document/message by number, status,
-- >             source and/or language.
-- >
-- > 010   1004   Document/message number                       C  an..35
-- > 020   1373   Document/message status, coded                C  an..3
-- > 030   1366   Document/message source                       C  an..35
-- > 040   3453   Language, coded                               C  an..3
--
-- Dependencies: 'simple1004', 'simple1366', 'simple1373', 'simple3453'.
compositeC503 :: Parser Value
compositeC503 =
  composite "C503"
    [ "010" .@ optional  simple1004
    , "020" .@ optional  simple1373
    , "030" .@ optional  simple1366
    , "040" .@ optional  simple3453
    ]
