{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S7124
  ( simple7124
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      7124  United Nations Dangerous Goods (UNDG) identifier        [B]
-- >
-- >      Desc: The unique serial number assigned within the United
-- >            Nations to substances and articles contained in a list
-- >            of the dangerous goods most commonly carried.
-- >
-- >      Repr: n4
simple7124 :: Parser Value
simple7124 = simple "7124" (numeric `exactly` 4)
