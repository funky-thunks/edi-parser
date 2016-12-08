{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S7164
  ( simple7164
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    7164  Hierarchical id. number
-- >
-- >    Desc: A unique number assigned by the sender to identify a level
-- >          within a hierarchical structure.
-- >
-- >    Repr: an..12
simple7164 :: Parser Value
simple7164 = simple "7164" (alphaNumeric `upTo` 12)
