{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S9213
  ( simple9213
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >   9213  Type of duty regime, coded
-- >
-- >   Desc: Identification of the statement of the full/preferential
-- >         regime according to which duty is assessed.
-- >
-- >   Repr: an..3
-- >
-- >         1 Origin subject to EC/EFTA preference
-- >              Self explanatory.
-- >         2 Origin subject to other preference agreement
-- >              Self explanatory.
-- >         3 No preference origin
-- >              Self explanatory.
-- >         8 Excluded origin
-- >              Self explanatory.
-- >         9 Imposed origin
-- >              Self explanatory.
simple9213 :: Parser Value
simple9213 = simple "9213" (alphaNumeric `upTo` 3)
