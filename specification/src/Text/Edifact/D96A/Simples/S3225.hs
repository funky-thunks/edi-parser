{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S3225
  ( simple3225
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    3225  Place/location identification
-- >
-- >    Desc: Identification of the name of place/location, other than 3164
-- >          City name.
-- >
-- >    Repr: an..25
-- >
-- >    Note: Use UN/ECE Recommendation No. 16: UNLOCODE.  If not
-- >          applicable, use appropriate code set in combination with
-- >          1131/3055.
simple3225 :: Parser Value
simple3225 = simple "3225" (alphaNumeric `upTo` 25)
