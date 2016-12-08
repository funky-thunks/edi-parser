{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S7140
  ( simple7140
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      7140  Item identifier                                         [C]
-- >
-- >      Desc: To identify an item.
-- >
-- >      Repr: an..35
simple7140 :: Parser Value
simple7140 = simple "7140" (alphaNumeric `upTo` 35)
