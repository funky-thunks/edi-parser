{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S8323
  ( simple8323
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >   8323  Transport movement, coded
-- >
-- >   Desc: Code indicating the movement of goods (e.g. import, export,
-- >         transit).
-- >
-- >   Repr: an..3
-- >
-- >         1 Export
-- >              Self explanatory.
-- >         2 Import
-- >              Self explanatory.
-- >         3 Transit
-- >              Self explanatory.
simple8323 :: Parser Value
simple8323 = simple "8323" (alphaNumeric `upTo` 3)
