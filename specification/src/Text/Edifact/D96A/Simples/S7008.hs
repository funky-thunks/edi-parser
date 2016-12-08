{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S7008
  ( simple7008
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    7008  Item description
-- >
-- >    Desc: Plain language description of articles or products.
-- >
-- >    Repr: an..35
simple7008 :: Parser Value
simple7008 = simple "7008" (alphaNumeric `upTo` 35)
