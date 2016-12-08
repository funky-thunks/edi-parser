{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S4052
  ( simple4052
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      4052  Delivery or transport terms description                 [B]
-- >
-- >      Desc: Free form description of delivery or transport terms.
-- >
-- >      Repr: an..70
simple4052 :: Parser Value
simple4052 = simple "4052" (alphaNumeric `upTo` 70)
