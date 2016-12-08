{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S4455
  ( simple4455
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >   4455  Back order, coded
-- >
-- >   Desc: Code to identify the back order agreement.
-- >
-- >   Repr: an..3
-- >
-- >    B      Back order only if new item (book industry - not yet
-- >           published only)
-- >              Item on back order due to unpublished status.
-- >    F      Factory ship
-- >              Ship directly from factory to purchaser.
-- >    N      No back order
-- >              Back order is unacceptable.
-- >    W      Warehouse ship
-- >              Ship directly from warehouse.
-- >    Y      Back order if out of stock
-- >              Acceptable to put on back order if out of stock.
-- >    ZZZ    Mutually defined
-- >              Self explanatory.
simple4455 :: Parser Value
simple4455 = simple "4455" (alphaNumeric `upTo` 3)
