{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S3045
  ( simple3045
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >   3045  Party name format, coded
-- >
-- >   Desc: Specification of the representation of a party name.
-- >
-- >   Repr: an..3
-- >
-- >         1 Name components in sequence as defined in description below
-- >              Name component 1: Family name Name component 2: Given
-- >              name or initials Name component 3: Given name or initials
-- >              Name component 4: Maiden name Name component 5: Title
-- >              Group of name components transmitted in sequence with
-- >              name component 1 transmitted first. The maiden name is
-- >              the family name given at birth of a female. Other names
-- >              are self-explanatory.
simple3045 :: Parser Value
simple3045 = simple "3045" (alphaNumeric `upTo` 3)
