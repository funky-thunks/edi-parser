{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S8246
  ( simple8246
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    8246  Dangerous goods label marking
-- >
-- >    Desc: Marking identifying the type of hazardous goods (substance),
-- >          Loading/Unloading instructions and advising actions in case
-- >          of emergency.
-- >
-- >    Repr: an..4
simple8246 :: Parser Value
simple8246 = simple "8246" (alphaNumeric `upTo` 4)
