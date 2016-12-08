{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S8211
  ( simple8211
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    8211  Permission for transport, coded
-- >
-- >    Desc: Code giving evidence that transportation of particular
-- >          hazardous cargo is permitted and identifies the restrictions
-- >          being put upon a particular transport.
-- >
-- >    Repr: an..3
-- >
-- >    Note: Code values to be provided.
simple8211 :: Parser Value
simple8211 = simple "8211" (alphaNumeric `upTo` 3)
