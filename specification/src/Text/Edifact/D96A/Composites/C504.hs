{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C504
  ( -- * Definition
    compositeC504
    -- * Dependencies
  , simple6343
  , simple6345
  , simple6347
  , simple6348
  ) where

import           Text.Edifact.D96A.Simples (simple6343, simple6345, simple6347,
                                            simple6348)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C504  CURRENCY DETAILS
-- >
-- >       Desc: The usage to which a currency relates.
-- >
-- > 010   6347   Currency details qualifier                    M  an..3
-- > 020   6345   Currency, coded                               C  an..3
-- > 030   6343   Currency qualifier                            C  an..3
-- > 040   6348   Currency rate base                            C  n..4
--
-- Dependencies: 'simple6343', 'simple6345', 'simple6347', 'simple6348'.
compositeC504 :: Parser Value
compositeC504 =
  composite "C504"
    [ "010" .@ mandatory simple6347
    , "020" .@ optional  simple6345
    , "030" .@ optional  simple6343
    , "040" .@ optional  simple6348
    ]
