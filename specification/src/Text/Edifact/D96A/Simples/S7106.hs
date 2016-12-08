{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S7106
  ( simple7106
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    7106  Shipment flashpoint
-- >
-- >    Desc: Temperature in centigrade determined by the closed cup test
-- >          as per ISO 1523/73 where a vapour is given off that can be
-- >          ignited.
-- >
-- >    Repr: n3
simple7106 :: Parser Value
simple7106 = simple "7106" (numeric `exactly` 3)
