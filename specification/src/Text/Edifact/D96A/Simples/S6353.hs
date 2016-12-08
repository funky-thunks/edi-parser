{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S6353
  ( simple6353
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >   6353  Number of units qualifier
-- >
-- >   Desc: Indication of the objective of number of units information.
-- >
-- >   Repr: an..3
-- >
-- >         1 Number of pricing units
-- >              [6170] Number of units which multiplied by the unit price
-- >              gives 5116 Line item amount.
-- >         2 Transportable unit
-- >              Self explanatory.
-- >         3 Number of debit units
-- >              The number of units which are debited by the sender of
-- >              the consignment to the receiving party.
-- >         4 Number of received units
-- >              The number of units which are received by the receiving
-- >              party of the consignment.
simple6353 :: Parser Value
simple6353 = simple "6353" (alphaNumeric `upTo` 3)
