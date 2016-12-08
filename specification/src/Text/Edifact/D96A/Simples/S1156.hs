{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S1156
  ( simple1156
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    1156  Line number
-- >
-- >    Desc: Number of the line in the document/message referenced in 1154
-- >          Reference number.
-- >
-- >    Repr: an..6
simple1156 :: Parser Value
simple1156 = simple "1156" (alphaNumeric `upTo` 6)
