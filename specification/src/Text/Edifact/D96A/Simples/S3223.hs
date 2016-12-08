{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S3223
  ( simple3223
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    3223  Related place/location one identification
-- >
-- >    Desc: Specification of the first related place/location by code.
-- >
-- >    Repr: an..25
-- >
-- >    Note: Use UN/ECE Recommendation No. 16: UNLOCODE.  If not
-- >          applicable, use appropriate code set in combination with
-- >          1131/3055.
simple3223 :: Parser Value
simple3223 = simple "3223" (alphaNumeric `upTo` 25)
