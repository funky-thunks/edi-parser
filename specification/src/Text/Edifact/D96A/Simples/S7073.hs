{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S7073
  ( simple7073
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >   7073  Packaging terms and conditions, coded
-- >
-- >   Desc: Code identifying packaging terms and conditions.
-- >
-- >   Repr: an..3
-- >
-- >         1 Packaging cost paid by supplier
-- >              Self explanatory.
-- >         2 Packaging cost paid by recipient
-- >              Self explanatory.
-- >         3 Packaging cost not charged (returnable)
-- >              Self explanatory.
-- >         4 Buyer's
-- >              Self explanatory.
-- >         5 Carrier's durable
-- >              Self explanatory.
-- >         6 Carrier's expendable
-- >              Self explanatory.
-- >         7 Seller's durable
-- >              Self explanatory.
-- >         8 Seller's expendable
-- >              Self explanatory.
-- >         9 Special purpose buyer's durable
-- >              Reusable packaging specifically designed for packaging of
-- >              the referenced item and owned by the buyer.
-- >        10 Special purpose buyer's expendable
-- >              Disposable packaging specifically designed for packaging
-- >              of the referenced item.
-- >        11 Multiple usage buyer's durable
-- >              Reusable multi-purpose packaging owned by the buyer.
-- >        12 Multiple usage seller's durable
-- >              Reusable multi-purpose packaging owned by the seller.
-- >        13 Not packed
-- >              The referenced item is to be supplied without packaging.
-- >        14 Special purpose seller's durable
-- >              Non-standard reusable packaging owned by the seller.
-- >        15 Export quality
-- >              The packaging used must meet durability and handling
-- >              characteristics required for item export.
-- >        16 Domestic quality
-- >              The packaging used must meet durability and handling
-- >              characteristics required for domestic usage.
-- >        17 Packaging included in price
-- >              The cost of packaging is included in the item price.
-- >        18 Packaging costs split
-- >              The cost of packaging is shared equally between the buyer
-- >              and seller.
-- >        19 Packaging costs invoiced separately
-- >              The packaging cost will be invoiced on a separate message
-- >              or document.
-- >        20 Nil packaging costs
-- >              The packaging is free of charge.
-- >        21 Nil packaging costs if packaging returned
-- >              The costs of packaging is reimbursed by the seller to
-- >              buyer if packaging is returned.
-- >        22 Return chargeable
-- >              The return of packaging/empties is chargeable.
-- >        23 Chargeable, two thirds of paid amount with credit note on
-- >           return of loaned  package
-- >              The buyer receives two thirds of paid amount with credit
-- >              note if loaned package is returned.
simple7073 :: Parser Value
simple7073 = simple "7073" (alphaNumeric `upTo` 3)
