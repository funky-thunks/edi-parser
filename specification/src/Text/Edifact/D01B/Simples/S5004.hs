{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S5004
  ( simple5004
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      5004  Monetary amount                                         [C]
-- >
-- >      Desc: To specify a monetary amount.
-- >
-- >      Repr: n..35
simple5004 :: Parser Value
simple5004 = simple "5004" (numeric `upTo` 35)
