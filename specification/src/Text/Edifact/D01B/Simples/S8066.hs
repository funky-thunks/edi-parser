{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S8066
  ( simple8066
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      8066  Transport mode name                                     [B]
-- >
-- >      Desc: Name of a mode of transport.
-- >
-- >      Repr: an..17
simple8066 :: Parser Value
simple8066 = simple "8066" (alphaNumeric `upTo` 17)
