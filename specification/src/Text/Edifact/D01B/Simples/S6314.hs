{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S6314
  ( simple6314
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      6314  Measurement value                                       [C]
-- >
-- >      Desc: To specify the value of a measurement.
-- >
-- >      Repr: an..18
simple6314 :: Parser Value
simple6314 = simple "6314" (alphaNumeric `upTo` 18)
