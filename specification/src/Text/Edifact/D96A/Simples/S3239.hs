{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S3239
  ( simple3239
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    3239  Country of origin, coded
-- >
-- >    Desc: Country in which the goods have been produced or
-- >          manufactured, according to criteria laid down for the
-- >          purposes of application of the Customs tariff, of
-- >          quantitative restrictions, or of any other measure related to
-- >          trade.
-- >
-- >    Repr: an..3
-- >
-- >    Note: See Country and currency codes (UNTDED) or ISO 3166 two alpha
-- >          country code (Code set 3207).
simple3239 :: Parser Value
simple3239 = simple "3239" (alphaNumeric `upTo` 3)
