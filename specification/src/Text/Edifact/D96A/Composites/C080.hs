{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C080
  ( -- * Definition
    compositeC080
    -- * Dependencies
  , simple3036
  , simple3045
  ) where

import           Text.Edifact.D96A.Simples (simple3036, simple3045)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C080  PARTY NAME
-- >
-- >       Desc: Identification of a transaction party by name, one to five
-- >             lines. Party name may be formatted.
-- >
-- > 010   3036   Party name                                    M  an..35
-- > 020   3036   Party name                                    C  an..35
-- > 030   3036   Party name                                    C  an..35
-- > 040   3036   Party name                                    C  an..35
-- > 050   3036   Party name                                    C  an..35
-- > 060   3045   Party name format, coded                      C  an..3
--
-- Dependencies: 'simple3036', 'simple3045'.
compositeC080 :: Parser Value
compositeC080 =
  composite "C080"
    [ "010" .@ mandatory simple3036
    , "020" .@ optional  simple3036
    , "030" .@ optional  simple3036
    , "040" .@ optional  simple3036
    , "050" .@ optional  simple3036
    , "060" .@ optional  simple3045
    ]
