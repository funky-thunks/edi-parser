{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S7511
  ( simple7511
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      7511  Marking type code                                       [B]
-- >
-- >      Desc: Code specifying the type of marking.
-- >
-- >      Repr: an..3
-- >
-- >      1     Not marked with an EAN.UCC system code
-- >               Indication that the package is not marked with an
-- >               EAN.UCC (International Article Numbering.Uniform Code
-- >               Council) system code.
simple7511 :: Parser Value
simple7511 = simple "7511" (alphaNumeric `upTo` 3)
