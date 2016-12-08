{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S4079
  ( simple4079
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      4079  Handling instruction description code                   [B]
-- >
-- >      Desc: Code specifying a handling instruction.
-- >
-- >      Repr: an..3
-- >
-- >      1     Heat sensitive
-- >               The object is heat sensitive.
-- >
-- >      2     Store in dry environment
-- >               The object must be stored in dry environment.
-- >
-- >      3     Stacked
-- >               The identified item is, or can be stacked.
simple4079 :: Parser Value
simple4079 = simple "4079" (alphaNumeric `upTo` 3)
