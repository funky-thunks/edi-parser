{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S8341
  ( simple8341
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >   8341  Haulage arrangements, coded
-- >
-- >   Desc: Specification of the type of equipment haulage arrangements.
-- >
-- >   Repr: an..3
-- >
-- >         1 Carrier
-- >              Haulage arranged by carrier.
-- >         2 Merchant
-- >              Haulage arranged by merchant (shipper, consignee, or
-- >              their agent).
simple8341 :: Parser Value
simple8341 = simple "8341" (alphaNumeric `upTo` 3)
