{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S7511
  ( simple7511
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    7511  Type of marking, coded
-- >
-- >    Desc: To specify the type of marking that reflects the method and
-- >          the conventions adhered to for marking.
-- >
-- >    Repr: an..3
simple7511 :: Parser Value
simple7511 = simple "7511" (alphaNumeric `upTo` 3)
