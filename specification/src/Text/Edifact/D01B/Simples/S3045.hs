{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S3045
  ( simple3045
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      3045  Party name format code                                  [C]
-- >
-- >      Desc: Code specifying the representation of a party name.
-- >
-- >      Repr: an..3
-- >
-- >      1     Name components in sequence as defined in description below
-- >               Name component 1: Family name. Name component 2: Given
-- >               name or initials. Name component 3: Given name or
-- >               initials. Name component 4: Maiden name. Name component
-- >               5: Title Group of name components transmitted in
-- >               sequence with name component 1 transmitted first. The
-- >               maiden name is the family name given at birth of a
-- >               female. Other names are self-explanatory.
-- >
-- >      2     Name component sequence 2, sequence as defined in
-- >            description
-- >               Name component 1: paternal name; name component 2:
-- >               maternal name; name component 3: given name or
-- >               initial(s); name component 4: middle name or initial(s);
-- >               name component 5: name suffix.
-- >
-- >      3     Name components in the sequence as defined in definition
-- >               Name component 1: Qualification
-- >               Name component 2: First part of the name
-- >               Name component 3: Second part of the name.
simple3045 :: Parser Value
simple3045 = simple "3045" (alphaNumeric `upTo` 3)
