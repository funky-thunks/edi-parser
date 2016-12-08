{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Composites.C076
  ( -- * Definition
    compositeC076
    -- * Dependencies
  , simple3148
  , simple3155
  ) where

import           Text.Edifact.D01B.Simples (simple3148, simple3155)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >        C076 COMMUNICATION CONTACT
-- >
-- >        Desc: Communication number of a department or employee in
-- >              a specified channel.
-- >
-- > 010    3148  Communication address identifier          M      an..512
-- > 020    3155  Communication address code qualifier      M      an..3
--
-- Dependencies: 'simple3148', 'simple3155'.
compositeC076 :: Parser Value
compositeC076 =
  composite "C076"
    [ "010" .@ mandatory simple3148
    , "020" .@ mandatory simple3155
    ]
