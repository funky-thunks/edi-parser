{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S9010
  ( simple9010
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    9010  Status event
-- >
-- >    Desc: Description of a status event.
-- >
-- >    Repr: an..35
simple9010 :: Parser Value
simple9010 = simple "9010" (alphaNumeric `upTo` 35)
