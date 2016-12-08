{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S8395
  ( simple8395
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >   8395  Returnable package freight payment responsibility, coded
-- >
-- >   Desc: To indicate responsibility for payment of return freight
-- >         charges for packaging that is returnable.
-- >
-- >   Repr: an..3
-- >
-- >         1 Paid by customer
-- >              Self explanatory.
-- >         2 Free
-- >              Self explanatory.
-- >         3 Paid by supplier
-- >              Self explanatory.
-- >    ZZZ    Mutually defined
-- >              Self explanatory.
simple8395 :: Parser Value
simple8395 = simple "8395" (alphaNumeric `upTo` 3)
