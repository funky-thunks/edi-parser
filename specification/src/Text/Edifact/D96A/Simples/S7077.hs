{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S7077
  ( simple7077
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- > * 7077  Item description type, coded
-- >
-- >   Desc: Code indicating the format of a description.
-- >
-- >   Repr: an..3
-- >
-- > +  A      Free-form long description
-- >              Long description of an item in free form.
-- >    B      Code and text
-- >              Self explanatory.
-- >    C      Code (from industry code list)
-- >              Self explanatory.
-- > +  D      Free-form price look up
-- >              Price look-up description of a product for point of sale
-- >              receipts.
-- > +  E      Free-form short description
-- >              Short description of an item in free form.
-- >    F      Free-form
-- >              Self explanatory.
-- >    S      Structured (from industry code list)
-- >              Self explanatory.
-- >    X      Semi-structured (code + text)
-- >              Self explanatory.
simple7077 :: Parser Value
simple7077 = simple "7077" (alphaNumeric `upTo` 3)
