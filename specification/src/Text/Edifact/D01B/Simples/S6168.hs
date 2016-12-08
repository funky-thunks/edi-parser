{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S6168
  ( simple6168
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      6168  Length dimension value                                  [C]
-- >
-- >      Desc: To specify the value of a length dimension.
-- >
-- >      Repr: n..15
simple6168 :: Parser Value
simple6168 = simple "6168" (numeric `upTo` 15)
