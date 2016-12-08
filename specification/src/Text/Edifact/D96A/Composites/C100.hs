{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C100
  ( -- * Definition
    compositeC100
    -- * Dependencies
  , simple1131
  , simple3055
  , simple4052
  , simple4053
  ) where

import           Text.Edifact.D96A.Simples (simple1131, simple3055, simple4052,
                                            simple4053)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C100  TERMS OF DELIVERY OR TRANSPORT
-- >
-- >       Desc: Terms of delivery or transport code from a specified
-- >             source.
-- >
-- > 010   4053   Terms of delivery or transport, coded         C  an..3
-- > 020   1131   Code list qualifier                           C  an..3
-- > 030   3055   Code list responsible agency, coded           C  an..3
-- > 040   4052   Terms of delivery or transport                C  an..70
-- > 050   4052   Terms of delivery or transport                C  an..70
--
-- Dependencies: 'simple1131', 'simple3055', 'simple4052', 'simple4053'.
compositeC100 :: Parser Value
compositeC100 =
  composite "C100"
    [ "010" .@ optional  simple4053
    , "020" .@ optional  simple1131
    , "030" .@ optional  simple3055
    , "040" .@ optional  simple4052
    , "050" .@ optional  simple4052
    ]
