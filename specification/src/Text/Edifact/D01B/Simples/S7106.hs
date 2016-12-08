{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S7106
  ( simple7106
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      7106  Shipment flashpoint value                               [B]
-- >
-- >      Desc: To specify the value of the flashpoint of a shipment.
-- >
-- >      Repr: n3
simple7106 :: Parser Value
simple7106 = simple "7106" (numeric `exactly` 3)
