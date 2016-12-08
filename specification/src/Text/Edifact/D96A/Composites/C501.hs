{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C501
  ( -- * Definition
    compositeC501
    -- * Dependencies
  , simple1131
  , simple3055
  , simple5245
  , simple5249
  , simple5482
  ) where

import           Text.Edifact.D96A.Simples (simple1131, simple3055, simple5245,
                                            simple5249, simple5482)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C501  PERCENTAGE DETAILS
-- >
-- >       Desc: Percentage relating to a specified basis.
-- >
-- > 010   5245   Percentage qualifier                          M  an..3
-- > 020   5482   Percentage                                    C  n..10
-- > 030   5249   Percentage basis, coded                       C  an..3
-- > 040   1131   Code list qualifier                           C  an..3
-- > 050   3055   Code list responsible agency, coded           C  an..3
--
-- Dependencies: 'simple1131', 'simple3055', 'simple5245', 'simple5249', 'simple5482'.
compositeC501 :: Parser Value
compositeC501 =
  composite "C501"
    [ "010" .@ mandatory simple5245
    , "020" .@ optional  simple5482
    , "030" .@ optional  simple5249
    , "040" .@ optional  simple1131
    , "050" .@ optional  simple3055
    ]
