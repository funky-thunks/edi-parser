{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S4403
  ( simple4403
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >   4403  Instruction qualifier
-- >
-- >   Desc: Code giving specific meaning to the type of instructions.
-- >
-- >   Repr: an..3
-- >
-- >         1 Action required
-- >              Instruction requires action.
-- >         2 Party instructions
-- >              Self explanatory.
-- >         3 Maximum value exceeded instructions
-- >              Instruction how to act if maximum value will be or has
-- >              been exceeded.
-- >         4 Confirmation instructions
-- >              Documentary credit confirmation instructions.
-- >         5 Method of issuance
-- >              Documentary credit confirmation of issuance.
-- >         6 Pre-advice instructions
-- >              Documentary credit pre-advice instructions.
-- >         7 Documents delivery instruction
-- >              Delivery instructions for documents required under a
-- >              documentary credit.
-- >         8 Additional terms and/or conditions documentary credit
-- >              Additional terms and/or  conditions to the documentary
-- >              credit.
-- >         9 Investment instruction
-- >              Instruction refers to an investment.
simple4403 :: Parser Value
simple4403 = simple "4403" (alphaNumeric `upTo` 3)
