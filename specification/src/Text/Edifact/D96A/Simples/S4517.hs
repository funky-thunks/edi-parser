{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S4517
  ( simple4517
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >   4517  Seal condition, coded
-- >
-- >   Desc: To indicate the condition of a seal.
-- >
-- >   Repr: an..3
-- >
-- >         1 In right condition
-- >              The seal is in right condition.
-- >         2 Damaged
-- >              The seal is damaged.
simple4517 :: Parser Value
simple4517 = simple "4517" (alphaNumeric `upTo` 3)
