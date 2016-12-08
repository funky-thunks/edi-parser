{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S8249
  ( simple8249
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >   8249  Equipment status, coded
-- >
-- >   Desc: Indication of the action related to the equipment.
-- >
-- >   Repr: an..3
-- >
-- >         1 Continental
-- >              Self explanatory.
-- >         2 Export
-- >              Transport equipment to be exported on a marine vessel.
-- >         3 Import
-- >              Transport equipment to be imported on a marine vessel.
-- >         4 Remain on board
-- >              Transport equipment arriving on a marine vessel is to
-- >              remain on board.
-- >         5 Shifter
-- >              Transport equipment is to be shifted from one stowage
-- >              location on a marine vessel to another on the same
-- >              vessel.
-- >         6 Transhipment
-- >              Transport equipment is to be transferred from one marine
-- >              vessel to another.
simple8249 :: Parser Value
simple8249 = simple "8249" (alphaNumeric `upTo` 3)
