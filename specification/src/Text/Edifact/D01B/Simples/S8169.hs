{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S8169
  ( simple8169
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      8169  Full or empty indicator code                            [B]
-- >
-- >      Desc: Code indicating whether an object is full or empty.
-- >
-- >      Repr: an..3
-- >
-- >      1     More than one quarter volume available
-- >               Self explanatory.
-- >
-- >      2     More than half volume available
-- >               Indicates that there is more than a half of the volume
-- >               available.
-- >
-- >      3     More than three quarters volume available
-- >               Indicates that there is more than three quarters of the
-- >               volume available.
-- >
-- >      4     Empty
-- >               Indicates that the object is empty.
-- >
-- >      5     Full
-- >               Indicates that the object is full.
-- >
-- >      6     No volume available
-- >               Indicates that there is no space available in the
-- >               object.
-- >
-- >      7     Full, mixed consignment
-- >               Indicates that the equipment is fully loaded, and
-- >               includes a number LCL (Less Than Container Load)
-- >               consignments.
-- >
-- >      8     Full, single consignment
-- >               Indicates that the container is fully loaded with a
-- >               single FCL (Full Container Load) consignment.
simple8169 :: Parser Value
simple8169 = simple "8169" (alphaNumeric `upTo` 3)
