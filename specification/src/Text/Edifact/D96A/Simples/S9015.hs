{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S9015
  ( simple9015
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >   9015  Status type, coded
-- >
-- >   Desc: Code identifying the type of status event.
-- >
-- >   Repr: an..3
-- >
-- >         1 Transport
-- >              Status type is related to transport.
simple9015 :: Parser Value
simple9015 = simple "9015" (alphaNumeric `upTo` 3)
