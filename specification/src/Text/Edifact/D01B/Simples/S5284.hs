{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S5284
  ( simple5284
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      5284  Unit price basis value                                  [B]
-- >
-- >      Desc: To specify the basis for a unit price.
-- >
-- >      Repr: n..9
simple5284 :: Parser Value
simple5284 = simple "5284" (numeric `upTo` 9)
