{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S5402
  ( simple5402
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      5402  Currency exchange rate                                  [C]
-- >
-- >      Desc: To specify the rate at which one specified currency is
-- >            expressed in another specified currency.
-- >
-- >      Repr: n..12
simple5402 :: Parser Value
simple5402 = simple "5402" (numeric `upTo` 12)
