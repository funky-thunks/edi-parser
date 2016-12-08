{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C076
  ( -- * Definition
    compositeC076
    -- * Dependencies
  , simple3148
  , simple3155
  ) where

import           Text.Edifact.D96A.Simples (simple3148, simple3155)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C076  COMMUNICATION CONTACT
-- >
-- >       Desc: Communication number of a department or employee in a
-- >             specified channel.
-- >
-- > 010   3148   Communication number                          M  an..512
-- > 020   3155   Communication channel qualifier               M  an..3
--
-- Dependencies: 'simple3148', 'simple3155'.
compositeC076 :: Parser Value
compositeC076 =
  composite "C076"
    [ "010" .@ mandatory simple3148
    , "020" .@ mandatory simple3155
    ]
