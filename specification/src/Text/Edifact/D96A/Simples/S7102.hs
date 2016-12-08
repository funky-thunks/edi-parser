{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S7102
  ( simple7102
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    7102  Shipping marks
-- >
-- >    Desc: Marks and numbers identifying individual packages.
-- >
-- >    Repr: an..35
simple7102 :: Parser Value
simple7102 = simple "7102" (alphaNumeric `upTo` 35)
