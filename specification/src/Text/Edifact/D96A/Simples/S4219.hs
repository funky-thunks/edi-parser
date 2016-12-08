{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S4219
  ( simple4219
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >   4219  Transport priority, coded
-- >
-- >   Desc: Coded priority of requested transport service.
-- >
-- >   Repr: an..3
-- >
-- >         1 Express
-- >              Express treatment (if by rail, legal express regime for
-- >              parcels transport).
-- >         2 High speed
-- >              Transport under legal international rail convention (CIM)
-- >              concluded between rail organizations and based on fast
-- >              routing and specified timetables.
-- >         3 Normal speed
-- >              Transport under legal international rail convention (CIM)
-- >              concluded between rail organizations.
-- >         4 Post service
-- >              Transport under conditions specified by UPU (Universal
-- >              Postal Union) and Rail organizations (parcels transport
-- >              only).
simple4219 :: Parser Value
simple4219 = simple "4219" (alphaNumeric `upTo` 3)
