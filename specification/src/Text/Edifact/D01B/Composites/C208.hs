{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Composites.C208
  ( -- * Definition
    compositeC208
    -- * Dependencies
  , simple7402
  ) where

import           Text.Edifact.D01B.Simples (simple7402)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >        C208 IDENTITY NUMBER RANGE
-- >
-- >        Desc: Goods item identification numbers, start and end of
-- >              consecutively numbered range.
-- >
-- > 010    7402  Object identifier                         M      an..35
-- > 020    7402  Object identifier                         C      an..35
--
-- Dependencies: 'simple7402'.
compositeC208 :: Parser Value
compositeC208 =
  composite "C208"
    [ "010" .@ mandatory simple7402
    , "020" .@ optional  simple7402
    ]
