{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S4453
  ( simple4453
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      4453  Free text function code                                 [B]
-- >
-- >      Desc: Code specifying the function of free text.
-- >
-- >      Repr: an..3
-- >
-- >      1     Text for subsequent use
-- >               The occurrence of this text does not affect message
-- >               processing.
-- >
-- >      2     Text replacing missing code
-- >               Text description of a coded data item for which there is
-- >               no currently available code.
-- >
-- >      3     Text for immediate use
-- >               Text must be read before actioning message.
-- >
-- >      4     No action required
-- >               Pass text on to later recipient.
-- >
-- >      5     Header
-- >               Indicates that the text is to be taken as a header.
-- >
-- >      6     Numbered paragraph
-- >               Indicates that the text starts a new numbered paragraph.
-- >
-- >      7     Paragraph
-- >               Indicates that the text is a paragraph.
simple4453 :: Parser Value
simple4453 = simple "4453" (alphaNumeric `upTo` 3)
