{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S7065
  ( simple7065
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    7065  Type of packages identification
-- >
-- >    Desc: Coded description of the form in which goods are presented.
-- >
-- >    Repr: an..17
-- >
-- >    Note: See UN/ECE Recommendation No. 21 (See Vol. II of UNTDED).
-- >          May be used in combination with 1131/3055.
simple7065 :: Parser Value
simple7065 = simple "7065" (alphaNumeric `upTo` 17)
