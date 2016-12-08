{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S7064
  ( simple7064
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    7064  Type of packages
-- >
-- >    Desc: Description of the form in which goods are presented.
-- >
-- >    Repr: an..35
simple7064 :: Parser Value
simple7064 = simple "7064" (alphaNumeric `upTo` 35)
