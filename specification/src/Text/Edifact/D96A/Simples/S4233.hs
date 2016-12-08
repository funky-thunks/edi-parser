{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S4233
  ( simple4233
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- > * 4233  Marking instructions, coded
-- >
-- >   Desc: Code indicating instructions on how specified packages or
-- >         physical units should be marked.
-- >
-- >   Repr: an..3
-- >
-- >         1 Do not mark suppliers company name
-- >              Self explanatory.
-- >         2 Mark customers company name
-- >              Self explanatory.
-- >         3 Mark customers references
-- >              Self explanatory.
-- >         4 Mark additionally customers article description
-- >              Self explanatory.
-- >         5 Mark exclusively customers article description
-- >              Self explanatory.
-- >         6 Mark packages dimensions
-- >              Self explanatory.
-- >         7 Mark net weight
-- >              Self explanatory.
-- >         8 Mark gross weight
-- >              Self explanatory.
-- >         9 Mark tare weight
-- >              Self explanatory.
-- >        10 Mark batch number
-- >              Self explanatory.
-- >        11 Mark article number customer
-- >              Self explanatory.
-- >        12 Mark running number of packages
-- >              Self explanatory.
-- >        13 Mark date of production
-- >              Self explanatory.
-- >        14 Mark expiry date
-- >              Self explanatory.
-- >        15 Mark supplier number
-- >              Self explanatory.
-- >        16 Buyer's instructions
-- >              Markings as specified by the buyer.
-- >        17 Seller's instructions
-- >              Markings as specified by the seller.
-- >        18 Carrier's instructions
-- >              Markings as specified by carrier.
-- >        19 Legal requirements
-- >              Markings as specified by law.
-- >        20 Industry instructions
-- >              Markings as specified by industry.
-- >        21 Line item only
-- >              Exclusive reference markings for this line.
-- >        22 Premarked by buyer
-- >              Self explanatory.
-- >        23 Entire shipment
-- >              Markings refer to the entire shipment.
-- >        24 Shipper assigned
-- >              Markings to identify a shipment, package or carton as
-- >              assigned by shipper.
-- >        25 Shipper assigned roll number
-- >              Markings to identify a roll as assigned by the shipper.
-- >        26 Shipper assigned skid number
-- >              Markings used to identify a skid as assigned by shipper.
-- >        27 Uniform Code Council (UCC) format
-- >              Markings according to UCC format are required. System of
-- >              coding products where by each item/multipack case type is
-- >              uniquely identified. A unique manufacturer Id is assigned
-- >              by the UCC.
-- >        28 Mark free text
-- >              Description to be provided.
-- > +      29 Mark case number
-- >              Case numbers to be used for marking.
-- > +      30 Mark serial shipping container code
-- >              Requests the marking of the serial shipping container
-- >              code to the transport container or packaging.
-- >    ZZZ    Mutually defined
-- >              Self explanatory.
simple4233 :: Parser Value
simple4233 = simple "4233" (alphaNumeric `upTo` 3)
