{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C211
  ( -- * Definition
    compositeC211
    -- * Dependencies
  , simple6008
  , simple6140
  , simple6168
  , simple6411
  ) where

import           Text.Edifact.D96A.Simples (simple6008, simple6140, simple6168,
                                            simple6411)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C211  DIMENSIONS
-- >
-- >       Desc: Specification of the dimensions of a transportable unit.
-- >
-- > 010   6411   Measure unit qualifier                        M  an..3
-- > 020   6168   Length dimension                              C  n..15
-- > 030   6140   Width dimension                               C  n..15
-- > 040   6008   Height dimension                              C  n..15
--
-- Dependencies: 'simple6008', 'simple6140', 'simple6168', 'simple6411'.
compositeC211 :: Parser Value
compositeC211 =
  composite "C211"
    [ "010" .@ mandatory simple6411
    , "020" .@ optional  simple6168
    , "030" .@ optional  simple6140
    , "040" .@ optional  simple6008
    ]
