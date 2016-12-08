{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S7402
  ( simple7402
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      7402  Object identifier                                       [C]
-- >
-- >      Desc: Code specifying the unique identity of an object.
-- >
-- >      Repr: an..35
simple7402 :: Parser Value
simple7402 = simple "7402" (alphaNumeric `upTo` 35)
