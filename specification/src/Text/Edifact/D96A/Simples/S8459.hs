{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S8459
  ( simple8459
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >   8459  Excess transportation responsibility, coded
-- >
-- >   Desc: Indication of responsibility for excess transportation.
-- >
-- >   Repr: an..3
-- >
-- >    A      Customer plant (receiving location)
-- >              Self explanatory.
-- >    B      Material release issuer
-- >              Self explanatory.
-- >    S      Supplier authority
-- >              Self explanatory.
-- >    X      Responsibility to be determined
-- >              Self explanatory.
-- >    ZZZ    Mutually defined
-- >              Self explanatory.
simple8459 :: Parser Value
simple8459 = simple "8459" (alphaNumeric `upTo` 3)
