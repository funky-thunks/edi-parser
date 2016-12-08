{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S7075
  ( simple7075
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >   7075  Packaging level, coded
-- >
-- >   Desc: Indication of level of packaging specified.
-- >
-- >   Repr: an..3
-- >
-- >         1 Inner
-- >              Level of packing, if it exists, that is immediately
-- >              subordinate to the intermediate packaging level.
-- >         2 Intermediate
-- >              Level of packaging, if it exists, that is immediately
-- >              subordinate to the outer packaging level.
-- >         3 Outer
-- >              For packed merchandise, outermost level of packaging for
-- >              a shipment.
-- >         4 No packaging hierarchy
-- >              There is no specifiable level of packaging: packaging is
-- >              inner and outer level as well.
simple7075 :: Parser Value
simple7075 = simple "7075" (alphaNumeric `upTo` 3)
