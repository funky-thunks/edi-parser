{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S6411
  ( simple6411
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- > |    6411  Measurement unit code                                   [C]
-- >
-- >      Desc: Code specifying the unit of measurement.
-- >
-- >      Repr: an..3
-- >
-- >      Note:
-- > |          1 Recommend use UN/ECE Recommendation 20, Common code.
simple6411 :: Parser Value
simple6411 = simple "6411" (alphaNumeric `upTo` 3)
