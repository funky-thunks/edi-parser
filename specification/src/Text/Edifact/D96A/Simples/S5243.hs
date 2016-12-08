{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S5243
  ( simple5243
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- > * 5243  Rate/tariff class identification
-- >
-- >   Desc: Identification of the rate/tariff class.
-- >
-- >   Repr: an..9
-- >
-- > +  A      Senior person rate
-- >              Rate class applies to senior persons.
-- >    B      Basic
-- >              Self explanatory.
-- >    C      Specific commodity rate
-- >              Self explanatory.
-- > +  D      Teenager rate
-- >              Rate class applies to teenagers.
-- > +  E      Child rate
-- >              Rate class applies to children.
-- > +  F      Adult rate
-- >              Rate class applies to adults.
-- >    K      Rate per kilogram
-- >              Self explanatory.
-- >    M      Minimum charge rate
-- >              Self explanatory.
-- >    N      Normal rate
-- >              Self explanatory.
-- >    Q      Quantity rate
-- >              Self explanatory.
-- >    R      Class rate (Reduction on normal rate)
-- >              Description to be provided.
-- >    S      Class rate (Surcharge on normal rate)
-- >              Description to be provided.
simple5243 :: Parser Value
simple5243 = simple "5243" (alphaNumeric `upTo` 9)
