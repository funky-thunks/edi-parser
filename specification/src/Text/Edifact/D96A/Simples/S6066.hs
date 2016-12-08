{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S6066
  ( simple6066
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    6066  Control value
-- >
-- >    Desc: Value obtained from summing the values specified by the
-- >          Control Qualifier throughout the message (Hash total).
-- >
-- >    Repr: n..18
simple6066 :: Parser Value
simple6066 = simple "6066" (numeric `upTo` 18)
