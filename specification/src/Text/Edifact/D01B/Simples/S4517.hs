{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S4517
  ( simple4517
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      4517  Seal condition code                                     [B]
-- >
-- >      Desc: Code specifying the condition of a seal.
-- >
-- >      Repr: an..3
-- >
-- >      1     In right condition
-- >               The seal is in right condition.
-- >
-- >      2     Damaged
-- >               The seal is damaged.
-- >
-- >      3     Missing
-- >               A seal that is missing.
-- >
-- >      4     Broken
-- >               Used to specify that the seal is broken.
-- >
-- >      5     Faulty electronic seal
-- >               The electronic seal is faulty.
simple4517 :: Parser Value
simple4517 = simple "4517" (alphaNumeric `upTo` 3)
