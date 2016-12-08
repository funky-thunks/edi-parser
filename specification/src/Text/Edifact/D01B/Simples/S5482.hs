{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S5482
  ( simple5482
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      5482  Percentage                                              [C]
-- >
-- >      Desc: To specify a percentage.
-- >
-- >      Repr: n..10
simple5482 :: Parser Value
simple5482 = simple "5482" (numeric `upTo` 10)
