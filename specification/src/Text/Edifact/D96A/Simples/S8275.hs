{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S8275
  ( simple8275
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >   8275  Container/package status, coded
-- >
-- >   Desc: Code to identify whether goods of separate description or
-- >         comprising separate consignments are contained in the same
-- >         external packaging or to indicate that a container or similar
-- >         unit load device is empty.
-- >
-- >   Repr: an..3
-- >
-- >         1 Full load
-- >              Container represents the full consignment of goods
-- >              declared on a single Customs declaration (i.e. all goods
-- >              in the container relate to a single Customs declaration).
-- >         2 Part load
-- >              Container represents part of a consignment declared on a
-- >              single Customs declaration (i.e. the Customs declaration
-- >              covers more than one container).
-- >         3 Full load mixed consignments
-- >              Container holds the full consignment related to the
-- >              Customs declaration but also holds goods related to other
-- >              declarations.
-- >         4 Part load mixed consignments
-- >              Container represents part of the consignment declared on
-- >              a single Customs declaration with the remainder being in
-- >              other containers. Other goods, related to other
-- >              declarations, are also in the container.
-- >         5 Single invoiced load
-- >              Merchandise within a container/package covered by a
-- >              single invoice.
-- >         6 Multi invoiced load
-- >              Merchandise within a container/package covered by more
-- >              than one invoice.
-- >         7 Empty
-- >              Container holds no goods.
-- >         8 Full load, multiple bills
-- >              A container representing a consignment of goods for one
-- >              consignee with multiple bill of lading numbers.
simple8275 :: Parser Value
simple8275 = simple "8275" (alphaNumeric `upTo` 3)
