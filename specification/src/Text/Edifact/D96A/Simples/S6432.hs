{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S6432
  ( simple6432
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    6432  Significant digits
-- >
-- >    Desc: To specify the number of significant digits.
-- >
-- >    Repr: n..2
simple6432 :: Parser Value
simple6432 = simple "6432" (numeric `upTo` 2)
