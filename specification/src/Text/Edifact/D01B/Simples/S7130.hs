{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S7130
  ( simple7130
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      7130  Customer shipment authorisation identifier              [B]
-- >
-- >      Desc: To identify the authorisation to ship issued by the
-- >            customer.
-- >
-- >      Repr: an..17
simple7130 :: Parser Value
simple7130 = simple "7130" (alphaNumeric `upTo` 17)
