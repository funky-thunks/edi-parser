{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S7166
  ( simple7166
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    7166  Hierarchical parent id.
-- >
-- >    Desc: Identification number of the next higher hierarchical data
-- >          segment in a hierarchical structure.
-- >
-- >    Repr: an..12
simple7166 :: Parser Value
simple7166 = simple "7166" (alphaNumeric `upTo` 12)
