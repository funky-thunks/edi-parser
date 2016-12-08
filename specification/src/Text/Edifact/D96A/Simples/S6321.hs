{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S6321
  ( simple6321
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >   6321  Measurement significance, coded
-- >
-- >   Desc: Code specifying the significance of a measurement value.
-- >
-- >   Repr: an..3
-- >
-- >         3 Approximately
-- >              Self explanatory.
-- >         4 Equal to
-- >              Self explanatory.
-- >         5 Greater than or equal to
-- >              Self explanatory.
-- >         6 Greater than
-- >              Self explanatory.
-- >         7 Less than
-- >              Self explanatory.
-- >         8 Less than or equal to
-- >              Self explanatory.
-- >        10 Not equal to
-- >              Self explanatory.
-- >        11 Trace
-- >              Description to be provided.
-- >        12 True value
-- >              Description to be provided.
-- >        13 Observed value
-- >              Description to be provided.
-- >        15 Out of range
-- >              Self explanatory.
simple6321 :: Parser Value
simple6321 = simple "6321" (alphaNumeric `upTo` 3)
