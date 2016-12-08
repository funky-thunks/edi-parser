{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S6246
  ( simple6246
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    6246  Temperature setting
-- >
-- >    Desc: The actual temperature value in degrees Celsius (e.g. 008,
-- >          020).
-- >
-- >    Repr: n3
simple6246 :: Parser Value
simple6246 = simple "6246" (numeric `exactly` 3)
