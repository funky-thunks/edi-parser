{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S1154
  ( simple1154
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    1154  Reference number
-- >
-- >    Desc: Identification number the nature and function of which can be
-- >          qualified by an entry in data element 1153 Reference
-- >          qualifier.
-- >
-- >    Repr: an..35
simple1154 :: Parser Value
simple1154 = simple "1154" (alphaNumeric `upTo` 35)
