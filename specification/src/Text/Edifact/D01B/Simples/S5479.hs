{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S5479
  ( simple5479
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      5479  Relation code                                           [C]
-- >
-- >      Desc: Code specifying a relation.
-- >
-- >      Repr: an..3
simple5479 :: Parser Value
simple5479 = simple "5479" (alphaNumeric `upTo` 3)
