{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S6069
  ( simple6069
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- > * 6069  Control qualifier
-- >
-- >   Desc: Determines the source data elements in the message which forms
-- >         the basis for 6066 Control value.
-- >
-- >   Repr: an..3
-- >
-- >         1 Algebraic total of the quantity values in line items in a
-- >           message
-- >              Self-explanatory.
-- >         2 Number of line items in message
-- >              Self-explanatory.
-- >         3 Number of line and sub items in message
-- >              Description to be provided.
-- >         4 Number of invoice lines
-- >              Number of lines on an invoice.
-- >         5 Number of Customs item detail lines
-- >              Total number of occurrences of the Customs item detail
-- >              section within a single Customs declaration message.
-- >         6 Number of Customs entries
-- >              Number of entries which are subject to the same Customs
-- >              procedures, and have the same tariff or statistical
-- >              heading, country and duty regime.
-- >         7 Total gross weight
-- >              Code to indicate total gross weight of a consignment.
-- >         8 Total pieces
-- >              Self explanatory.
-- >         9 Total number of ULD (Unit Load Device)
-- >              The total number of Unit Load Devices mentioned in the
-- >              message.
-- >        10 Total number of consignments
-- >              The total number of consignments.
-- >        11 Total number of packages
-- >              [7370] Total number of packages of the entire
-- >              consignment.
-- >        12 Invoice total amount
-- >              [5444] Total sum charged in respect of one or more
-- >              Invoices in accordance with the terms of delivery.
-- >        13 Number of loading lists
-- >              [1166] Number of loading lists, manifests or other
-- >              similar specifications attached to a document.
-- >        14 Number of Customs commercial detail lines
-- >              Commercial detail section within a single Customs
-- >              declaration message.
-- >        15 Total consignment, cube
-- >              The total cube of consignment.
-- >        16 Total number of equipment
-- >              Total number of equipment mentioned in the message.
-- >        17 Declared total Customs value
-- >              [5070] Total value declared for Customs purposes of all
-- >              goods in a consignment, whether or not they are subject
-- >              to the same Customs procedure, or have the same
-- >              tariff/statistical heading, country information, and duty
-- >              regime.
-- >        18 Total reported quantity in net weight
-- >              Total reported quantity in net weight.
-- >        19 Total reported quantity in supplementary units
-- >              Total reported quantity in supplementary units.
-- >        20 Total reported invoice(s) value
-- >              Hash total of the total monetary amounts reported on the
-- >              invoices.
-- >        21 Total reported ancillary costs
-- >              Hash total of the reported total extra costs (e.g.
-- >              carriage, freight, insurance) of all invoices.
-- >        22 Total reported statistical value
-- >              The total reported statistical value.
-- >        23 Total ordered quantity
-- >              Total quantity ordered in this message.
-- >        24 Number of orders referenced in this message
-- >              Total number of order messages or documents referenced in
-- >              this message.
-- >        25 Number of rejected order lines
-- >              Total number of rejected order lines in this message.
-- >        26 Total gross measurement/cube
-- >              Total gross cubic measurement of the goods, including
-- >              packing but excluding transport equipment.
-- >        27 Total number of credit items given for control purposes
-- >              Total number of credit items given for control purposes.
-- >        28 Total number of debit items given for control purposes
-- >              Total number of debit items given for control purposes.
-- >        29 Total net weight of consignment
-- >              A code to indicate the total net weight of a consignment.
-- > +      30 Total number of empty containers
-- >              The total number of empty containers mentioned in the
-- >              message.
-- > +      31 Number of messages
-- >              Control count of the number of messages referenced.
simple6069 :: Parser Value
simple6069 = simple "6069" (alphaNumeric `upTo` 3)
