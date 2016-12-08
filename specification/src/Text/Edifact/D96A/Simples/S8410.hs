{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S8410
  ( simple8410
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    8410  MFAG
-- >
-- >    Desc: Medical first aid guide.
-- >
-- >    Repr: an..4
simple8410 :: Parser Value
simple8410 = simple "8410" (alphaNumeric `upTo` 4)
