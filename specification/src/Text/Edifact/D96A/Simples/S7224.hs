{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S7224
  ( simple7224
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    7224  Number of packages
-- >
-- >    Desc: Number of individual parts of a shipment either unpacked, or
-- >          packed in such a way that they cannot be divided without
-- >          first undoing the packing.
-- >
-- >    Repr: n..8
simple7224 :: Parser Value
simple7224 = simple "7224" (numeric `upTo` 8)
