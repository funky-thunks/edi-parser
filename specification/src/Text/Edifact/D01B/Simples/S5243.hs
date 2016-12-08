{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S5243
  ( simple5243
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      5243  Rate or tariff class description code                   [C]
-- >
-- >      Desc: Code specifying an applicable rate or tariff class.
-- >
-- >      Repr: an..9
-- >
-- >      A     Senior person rate
-- >               Rate class applies to senior persons.
-- >
-- >      B     Basic
-- >               Code specifying that the rate or tariff is a basic one.
-- >
-- >      C     Specific commodity rate
-- >               Code specifying the specific commodity rate.
-- >
-- >      D     Teenager rate
-- >               Rate class applies to teenagers.
-- >
-- >      E     Child rate
-- >               Rate class applies to children.
-- >
-- >      F     Adult rate
-- >               Rate class applies to adults.
-- >
-- >      K     Rate per kilogram
-- >               Code specifying the rate per kilogram.
-- >
-- >      M     Minimum charge rate
-- >               Code specifying the minimum charge rate.
-- >
-- >      N     Normal rate
-- >               Code specifying the normal rate.
-- >
-- >      Q     Quantity rate
-- >               Code specifying the quantity rate.
-- >
-- >      R     Class rate (Reduction on normal rate)
-- >               Code specifying the reduction on normal rate.
-- >
-- >      S     Class rate (Surcharge on normal rate)
-- >               Code specifying the surcharge on normal rate.
simple5243 :: Parser Value
simple5243 = simple "5243" (alphaNumeric `upTo` 9)
