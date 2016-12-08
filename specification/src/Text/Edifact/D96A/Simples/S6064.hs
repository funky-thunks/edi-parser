{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S6064
  ( simple6064
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    6064  Quantity difference
-- >
-- >    Desc: Numeric value of variance between ordered/shipped/invoiced
-- >          quantities.
-- >
-- >    Repr: n..15
simple6064 :: Parser Value
simple6064 = simple "6064" (numeric `upTo` 15)
