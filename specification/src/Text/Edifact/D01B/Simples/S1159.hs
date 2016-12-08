{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S1159
  ( simple1159
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      1159  Sequence identifier source code                         [B]
-- >
-- >      Desc: Code specifying the source of a sequence identifier.
-- >
-- >      Repr: an..3
-- >
-- >      1     Broadcast 1
-- >               Report from workstation 1.
-- >
-- >      2     Broadcast 2
-- >               Report from workstation 2.
-- >
-- >      3     Manufacturer sequence number
-- >               The manufacturer's plant requesting the delivery of the
-- >               item has allocated the sequence number.
-- >
-- >      4     Manufacturer production sequence number
-- >               The plant requesting the delivery of an item assigns a
-- >               number indicating the sequence of the finished article.
-- >
-- >      5     Transmission sequence
-- >               The positional sequence when transmitted.
-- >
-- >      6     Structure sequence
-- >               The positional sequence in a message structure as
-- >               published in a particular UN directory.
simple1159 :: Parser Value
simple1159 = simple "1159" (alphaNumeric `upTo` 3)
