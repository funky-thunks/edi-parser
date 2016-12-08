{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S9303
  ( simple9303
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >   9303  Sealing party, coded
-- >
-- >   Desc: Identification of the issuer of the seal number.
-- >
-- >   Repr: an..3
-- >
-- >    CA     Carrier
-- >              Party undertaking or arranging transport of goods between
-- >              named points.
-- >    CU     Customs
-- >              Self explanatory.
-- >    SH     Shipper
-- >              Party which, by contract with a carrier, consigns or
-- >              sends goods with the carrier, or has them conveyed by
-- >              him.
-- >    TO     Terminal operator
-- >              Party which handles the loading and unloading of marine
-- >              vessels.
simple9303 :: Parser Value
simple9303 = simple "9303" (alphaNumeric `upTo` 3)
