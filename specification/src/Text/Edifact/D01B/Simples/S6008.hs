{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S6008
  ( simple6008
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      6008  Height dimension value                                  [C]
-- >
-- >      Desc: To specify the value of a height dimension.
-- >
-- >      Repr: n..15
simple6008 :: Parser Value
simple6008 = simple "6008" (numeric `upTo` 15)
