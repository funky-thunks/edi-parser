{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S7160
  ( simple7160
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    7160  Special service
-- >
-- >    Desc: Description of a special service.
-- >
-- >    Repr: an..35
simple7160 :: Parser Value
simple7160 = simple "7160" (alphaNumeric `upTo` 35)
