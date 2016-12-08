{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S8126
  ( simple8126
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    8126  Trem card number
-- >
-- >    Desc: The identification of a transport emergency card giving
-- >          advice for emergency actions.
-- >
-- >    Repr: an..10
simple8126 :: Parser Value
simple8126 = simple "8126" (alphaNumeric `upTo` 10)
