{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C222
  ( -- * Definition
    compositeC222
    -- * Dependencies
  , simple1131
  , simple3055
  , simple8212
  , simple8213
  , simple8453
  ) where

import           Text.Edifact.D96A.Simples (simple1131, simple3055, simple8212,
                                            simple8213, simple8453)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C222  TRANSPORT IDENTIFICATION
-- >
-- >       Desc: Code and/or name identifying the means of transport.
-- >
-- > 010   8213   Id. of means of transport identification      C  an..9
-- > 020   1131   Code list qualifier                           C  an..3
-- > 030   3055   Code list responsible agency, coded           C  an..3
-- > 040   8212   Id. of the means of transport                 C  an..35
-- > 050   8453   Nationality of means of transport, coded      C  an..3
--
-- Dependencies: 'simple1131', 'simple3055', 'simple8212', 'simple8213', 'simple8453'.
compositeC222 :: Parser Value
compositeC222 =
  composite "C222"
    [ "010" .@ optional  simple8213
    , "020" .@ optional  simple1131
    , "030" .@ optional  simple3055
    , "040" .@ optional  simple8212
    , "050" .@ optional  simple8453
    ]
