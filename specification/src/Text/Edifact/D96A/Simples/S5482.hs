{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S5482
  ( simple5482
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- > *  5482  Percentage
-- >
-- >    Desc: Value expressed as a percentage of a specified amount.
-- >
-- >    Repr: n..10
simple5482 :: Parser Value
simple5482 = simple "5482" (numeric `upTo` 10)
