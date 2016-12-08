{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S6343
  ( simple6343
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >   6343  Currency qualifier
-- >
-- >   Desc: Code giving specific meaning to data element 6345 Currency.
-- >
-- >   Repr: an..3
-- >
-- >         1 Customs valuation currency
-- >              The name or symbol of the monetary unit involved in the
-- >              transaction for customs valuation.
-- >         2 Insurance currency
-- >              The name or symbol of the monetary unit involved in the
-- >              transaction for insurance purposes.
-- >         3 Home currency
-- >              The name or symbol of the local monetary unit.
-- >         4 Invoicing currency
-- >              The name or symbol of the monetary unit used for
-- >              calculation in an invoice.
-- >         5 Account currency
-- >              The name or symbol of the monetary unit to be converted
-- >              from.
-- >         6 Reference currency
-- >              The name or symbol of the monetary unit to be converted.
-- >         7 Target currency
-- >              The name or symbol of the monetary unit to be converted
-- >              into.
-- >         8 Price list currency
-- >              The name or symbol of the monetary unit used in a price
-- >              list.
-- >         9 Order currency
-- >              The name or symbol of the monetary unit used in an order.
-- >        10 Pricing currency
-- >              The name or symbol of the monetary unit used for pricing
-- >              purposes.
-- >        11 Payment currency
-- >              The name or symbol of the monetary unit used for payment.
-- >        12 Quotation currency
-- >              The name or symbol of the monetary unit used in a
-- >              quotation.
-- >        13 Recipient local currency
-- >              The name or symbol of the local monetary unit at
-- >              recipient's location.
-- >        14 Supplier currency
-- >              The name or symbol of the monetary unit normally used by
-- >              the supplier.
-- >        15 Sender local currency
-- >              The name or symbol of the local monetary unit at sender's
-- >              location.
-- >        16 Tariff currency
-- >              The currency as per tariff.
-- >        17 Charge calculation currency
-- >              The currency in which the charges are calculated.
simple6343 :: Parser Value
simple6343 = simple "6343" (alphaNumeric `upTo` 3)
