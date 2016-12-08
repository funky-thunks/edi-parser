{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S3207
  ( simple3207
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    3207  Country, coded
-- >
-- >    Desc: Identification of the name of a country or other geographical
-- >          entity as specified in ISO 3166.
-- >
-- >    Repr: an..3
-- >
-- >    Note: Use ISO 3166 two alpha country code.
simple3207 :: Parser Value
simple3207 = simple "3207" (alphaNumeric `upTo` 3)
