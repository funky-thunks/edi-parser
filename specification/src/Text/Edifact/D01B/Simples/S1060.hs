{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S1060
  ( simple1060
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      1060  Revision identifier                                     [B]
-- >
-- >      Desc: To identify a revision.
-- >
-- >      Repr: an..6
simple1060 :: Parser Value
simple1060 = simple "1060" (alphaNumeric `upTo` 6)
