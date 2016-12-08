{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S7224
  ( simple7224
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      7224  Package quantity                                        [B]
-- >
-- >      Desc: To specify the number of packages.
-- >
-- >      Repr: n..8
simple7224 :: Parser Value
simple7224 = simple "7224" (numeric `upTo` 8)
