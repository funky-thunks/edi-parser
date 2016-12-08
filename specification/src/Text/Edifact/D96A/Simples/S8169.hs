{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S8169
  ( simple8169
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >   8169  Full/empty indicator, coded
-- >
-- >   Desc: To indicate the extent to which the equipment is full or
-- >         empty.
-- >
-- >   Repr: an..3
-- >
-- >         1 More than one quarter volume available
-- >              Self explanatory.
-- >         2 More than half volume available
-- >              Self explanatory.
-- >         3 More than three quarters volume available
-- >              Self explanatory.
-- >         4 Empty
-- >              Self explanatory.
-- >         5 Full
-- >              Self explanatory.
-- >         6 No volume available
-- >              Self explanatory.
-- >         7 Full, mixed consignment
-- >              Indicates that the equipment is fully loaded, and
-- >              includes a number LCL (Less Than Container Load)
-- >              consignments.
-- >         8 Full, single consignment
-- >              Indicates that the container is fully loaded with a
-- >              single FCL (Full Container Load) consignment.
simple8169 :: Parser Value
simple8169 = simple "8169" (alphaNumeric `upTo` 3)
