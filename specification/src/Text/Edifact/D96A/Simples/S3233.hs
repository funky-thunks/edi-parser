{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S3233
  ( simple3233
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    3233  Related place/location two identification
-- >
-- >    Desc: Specification of a second related place/location by code.
-- >
-- >    Repr: an..25
-- >
-- >    Note: Use UN/ECE Recommendation No. 16: UNLOCODE.  If not
-- >          applicable, use appropriate code set in combination with
-- >          1131/3055.
simple3233 :: Parser Value
simple3233 = simple "3233" (alphaNumeric `upTo` 25)
