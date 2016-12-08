{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S5213
  ( simple5213
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >   5213  Sub-line price change, coded
-- >
-- >   Desc: Code indicating disposition of the price change of a sub-line
-- >         item.
-- >
-- >   Repr: an..3
-- >
-- >    A      Added to the baseline item unit price
-- >              Self explanatory.
-- >    I      Included in the baseline item unit price
-- >              Self explanatory.
-- >    S      Subtracted from the baseline item unit price
-- >              Self explanatory.
simple5213 :: Parser Value
simple5213 = simple "5213" (alphaNumeric `upTo` 3)
