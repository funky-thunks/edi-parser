{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S5495
  ( simple5495
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >   5495  Sub-line indicator, coded
-- >
-- >   Desc: Indication that the segment and/or segment group is used for
-- >         sub-line item information.
-- >
-- >   Repr: an..3
-- >
-- >         1 Sub-line information
-- >              Self explanatory.
simple5495 :: Parser Value
simple5495 = simple "5495" (alphaNumeric `upTo` 3)
