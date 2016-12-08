{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C279
  ( -- * Definition
    compositeC279
    -- * Dependencies
  , simple6063
  , simple6064
  ) where

import           Text.Edifact.D96A.Simples (simple6063, simple6064)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C279  QUANTITY DIFFERENCE INFORMATION
-- >
-- >       Desc: Information on quantity difference.
-- >
-- > 010   6064   Quantity difference                           M  n..15
-- > 020   6063   Quantity qualifier                            C  an..3
--
-- Dependencies: 'simple6063', 'simple6064'.
compositeC279 :: Parser Value
compositeC279 =
  composite "C279"
    [ "010" .@ mandatory simple6064
    , "020" .@ optional  simple6063
    ]
