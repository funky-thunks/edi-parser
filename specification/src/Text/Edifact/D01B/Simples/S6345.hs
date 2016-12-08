{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S6345
  ( simple6345
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      6345  Currency identification code                            [C]
-- >
-- >      Desc: Code specifying a monetary unit.
-- >
-- >      Repr: an..3
-- >
-- >      Note:
-- >            1 Use ISO 4217 three alpha code.
simple6345 :: Parser Value
simple6345 = simple "6345" (alphaNumeric `upTo` 3)
