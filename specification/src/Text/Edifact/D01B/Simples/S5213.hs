{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S5213
  ( simple5213
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      5213  Sub-line item price change operation code               [C]
-- >
-- >      Desc: Code specifying the price change operation for a sub-
-- >            line item.
-- >
-- >      Repr: an..3
-- >
-- >      A     Added to the baseline item unit price
-- >               Price is to be added to the base line unit price.
-- >
-- >      I     Included in the baseline item unit price
-- >               Price is included in the base line unit price.
-- >
-- >      S     Subtracted from the baseline item unit price
-- >               Price is to be subtracted from the base line unit price.
simple5213 :: Parser Value
simple5213 = simple "5213" (alphaNumeric `upTo` 3)
