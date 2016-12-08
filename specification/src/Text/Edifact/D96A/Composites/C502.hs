{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C502
  ( -- * Definition
    compositeC502
    -- * Dependencies
  , simple6154
  , simple6155
  , simple6313
  , simple6321
  ) where

import           Text.Edifact.D96A.Simples (simple6154, simple6155, simple6313,
                                            simple6321)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C502  MEASUREMENT DETAILS
-- >
-- >       Desc: Identification of measurement type.
-- >
-- > 010   6313   Measurement dimension, coded                  C  an..3
-- > 020   6321   Measurement significance, coded               C  an..3
-- > 030   6155   Measurement attribute, coded                  C  an..3
-- > 040   6154   Measurement attribute                         C  an..70
--
-- Dependencies: 'simple6154', 'simple6155', 'simple6313', 'simple6321'.
compositeC502 :: Parser Value
compositeC502 =
  composite "C502"
    [ "010" .@ optional  simple6313
    , "020" .@ optional  simple6321
    , "030" .@ optional  simple6155
    , "040" .@ optional  simple6154
    ]
