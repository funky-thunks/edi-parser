{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S8023
  ( simple8023
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    8023  Freight and charges identification
-- >
-- >    Desc: Coded description of freight charges and other charges (used
-- >          in combination with 1131/3055).
-- >
-- >    Repr: an..17
-- >
-- >    Note: Use UN/ECE Recommendation No. 23: Freight costs and charges.
-- >          If not applicable, use appropriate code in combination with
-- >          1131/3055.
simple8023 :: Parser Value
simple8023 = simple "8023" (alphaNumeric `upTo` 17)
