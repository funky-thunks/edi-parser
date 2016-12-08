{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S3232
  ( simple3232
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    3232  Related place/location two
-- >
-- >    Desc: Specification of a second related place/location by name.
-- >
-- >    Repr: an..70
simple3232 :: Parser Value
simple3232 = simple "3232" (alphaNumeric `upTo` 70)
