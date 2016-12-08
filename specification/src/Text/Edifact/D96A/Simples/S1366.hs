{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S1366
  ( simple1366
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    1366  Document/message source
-- >
-- >    Desc: Indication of the source from which the printed information
-- >          is to be or has been obtained.
-- >
-- >    Repr: an..35
simple1366 :: Parser Value
simple1366 = simple "1366" (alphaNumeric `upTo` 35)
