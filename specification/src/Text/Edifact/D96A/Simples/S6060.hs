{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S6060
  ( simple6060
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    6060  Quantity
-- >
-- >    Desc: Numeric value of a quantity.
-- >
-- >    Repr: n..15
simple6060 :: Parser Value
simple6060 = simple "6060" (numeric `upTo` 15)
