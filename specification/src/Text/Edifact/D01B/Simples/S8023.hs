{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S8023
  ( simple8023
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      8023  Freight and other charges description identifier        [B]
-- >
-- >      Desc: Code identifying freight and other charges.
-- >
-- >      Repr: an..17
-- >
-- >      Note:
-- >            1 Use UN/ECE Recommendation No. 23: Freight costs and
-- >            charges. If not applicable, use appropriate code in
-- >            combination with 1131/3055.
simple8023 :: Parser Value
simple8023 = simple "8023" (alphaNumeric `upTo` 17)
