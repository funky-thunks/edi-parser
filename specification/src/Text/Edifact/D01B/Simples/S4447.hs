{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S4447
  ( simple4447
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      4447  Free text format code                                   [B]
-- >
-- >      Desc: Code specifying the format of free text.
-- >
-- >      Repr: an..3
-- >
-- >      1     Centre
-- >               The associated text is centred in the available space.
-- >
-- >      2     Left
-- >               The associated text item is aligned flush left in the
-- >               available space.
-- >
-- >      3     Right
-- >               The associated text is aligned flush right in the
-- >               available space.
-- >
-- >      4     Justified
-- >               The associated text is justified in the available space.
-- >
-- >      5     Preceded by one blank line
-- >               The text is to be preceded by one blank line.
-- >
-- >      6     Preceded by two blank lines
-- >               The text is to be preceded by two blank lines.
-- >
-- >      7     Preceded by three blank lines
-- >               The text is to be preceded by three blank lines.
-- >
-- >      8     Continuation
-- >               The text is a continuation of preceding text.
-- >
-- >      9     New page
-- >               The text is to begin on a new page.
-- >
-- >      10    End text
-- >               The text is the final section of the preceding text.
-- >
-- >      11    New line
-- >               The text is to begin a new line.
simple4447 :: Parser Value
simple4447 = simple "4447" (alphaNumeric `upTo` 3)
