{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S7419
  ( simple7419
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    7419  Hazardous material class code, identification
-- >
-- >    Desc: Code specifying the kind of hazard for a material.
-- >
-- >    Repr: an..4
-- >
-- >    Note: Association defined code.  May be used in combination with
-- >          1131/3055.
simple7419 :: Parser Value
simple7419 = simple "7419" (alphaNumeric `upTo` 4)
