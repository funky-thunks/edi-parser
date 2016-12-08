{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S6350
  ( simple6350
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    6350  Number of units
-- >
-- >    Desc: Number of units of a certain type.
-- >
-- >    Repr: n..15
simple6350 :: Parser Value
simple6350 = simple "6350" (numeric `upTo` 15)
