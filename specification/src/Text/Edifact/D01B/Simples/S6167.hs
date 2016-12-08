{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S6167
  ( simple6167
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      6167  Range type code qualifier                               [B]
-- >
-- >      Desc: Code qualifying a type of range.
-- >
-- >      Repr: an..3
-- >
-- >      1     Allowance range
-- >               Identifies the range for an allowance.
-- >
-- >      2     Charge range
-- >               Identifies the range for a charge.
-- >
-- >      3     Monetary range
-- >               Identifies the range related to money.
-- >
-- >      4     Quantity range
-- >               Identifies the range for quantity.
-- >
-- >      5     Temperature range
-- >               The range of a temperature.
-- >
-- >      6     Order quantity range
-- >               The minimum to maximum order quantity.
-- >
-- >      7     Delivery quantity range
-- >               The minimum to maximum delivery quantity.
-- >
-- >      8     Production batch range
-- >               The minimum to maximum quantity in a single production
-- >               run.
-- >
-- >      9     Monthly quantity range
-- >               The minimum to maximum monthly quantity.
-- >
-- >      10    Annual quantity range
-- >               The minimum to maximum yearly quantity.
-- >
-- >      11    Package stacking range
-- >               Range in which packages can be stacked.
-- >
-- >      12    Transport temperature range
-- >               The temperature range at which cargo is to be kept while
-- >               it is under transport.
-- >
-- >      13    Equipment pre-tripping temperature range
-- >               The temperature range at which the equipment is to be
-- >               brought to in preparation for the loading of cargo.
-- >
-- >      14    Terms discount range
-- >               Identifies the range for a terms discount.
-- >
-- >      15    Order quantity range, cumulative
-- >               The minimum to maximum cumulative order quantity.
simple6167 :: Parser Value
simple6167 = simple "6167" (alphaNumeric `upTo` 3)
