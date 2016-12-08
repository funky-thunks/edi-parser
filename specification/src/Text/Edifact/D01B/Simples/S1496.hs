{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S1496
  ( simple1496
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      1496  Goods item number                                       [B]
-- >
-- >      Desc: To specify a goods item within a consignment.
-- >
-- >      Repr: n..5
simple1496 :: Parser Value
simple1496 = simple "1496" (numeric `upTo` 5)
