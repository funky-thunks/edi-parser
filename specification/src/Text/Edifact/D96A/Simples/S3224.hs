{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S3224
  ( simple3224
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- > *  3224  Place/location
-- >
-- >    Desc: Name of place/location, other than 3164 City name.
-- >
-- >    Repr: an..70
simple3224 :: Parser Value
simple3224 = simple "3224" (alphaNumeric `upTo` 70)
