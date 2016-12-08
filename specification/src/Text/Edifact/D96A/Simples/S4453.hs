{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S4453
  ( simple4453
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >   4453  Text function, coded
-- >
-- >   Desc: Code specifying how to handle the text.
-- >
-- >   Repr: an..3
-- >
-- >         1 Text for subsequent use
-- >              The occurrence of this text does not affect message
-- >              processing.
-- >         2 Text replacing missing code
-- >              Text description of a coded data item for which there is
-- >              no currently available code.
-- >         3 Text for immediate use
-- >              Text must be read before actioning message.
-- >         4 No action required
-- >              Pass text on to later recipient.
simple4453 :: Parser Value
simple4453 = simple "4453" (alphaNumeric `upTo` 3)
