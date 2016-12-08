{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S6246
  ( simple6246
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      6246  Temperature value                                       [B]
-- >
-- >      Desc: To specify the value of a temperature.
-- >
-- >      Repr: n..15
simple6246 :: Parser Value
simple6246 = simple "6246" (numeric `upTo` 15)
