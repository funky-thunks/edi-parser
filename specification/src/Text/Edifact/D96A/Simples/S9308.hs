{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S9308
  ( simple9308
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    9308  Seal number
-- >
-- >    Desc: The number of a custom seal or another seal affixed to the
-- >          containers or other transport unit.
-- >
-- >    Repr: an..10
simple9308 :: Parser Value
simple9308 = simple "9308" (alphaNumeric `upTo` 10)
