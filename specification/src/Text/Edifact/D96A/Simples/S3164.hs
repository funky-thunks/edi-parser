{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S3164
  ( simple3164
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    3164  City name
-- >
-- >    Desc: Name of a city (a town, a village) for addressing purposes.
-- >
-- >    Repr: an..35
simple3164 :: Parser Value
simple3164 = simple "3164" (alphaNumeric `upTo` 35)
