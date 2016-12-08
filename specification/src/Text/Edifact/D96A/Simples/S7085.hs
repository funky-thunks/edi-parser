{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S7085
  ( simple7085
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- > * 7085  Nature of cargo, coded
-- >
-- >   Desc: Code indicating the type of cargo as a rough classification.
-- >
-- >   Repr: an..3
-- >
-- >         1 Documents
-- >              Printed, typed or written matter including leaflets,
-- >              pamphlets, certificates etc., which are not subject to
-- >              import duties and taxes, restrictions and prohibitions.
-- >         2 Low value non-dutiable consignments
-- >              Imported consignments/items/goods in respect of which
-- >              Customs duties and other taxes are waived as they are
-- >              below a value determined by the Customs administration.
-- >         3 Low value dutiable consignments
-- >              Imported consignments/items/goods in respect of which
-- >              Customs duties and other taxes are payable are below a
-- >              certain amount as determined by the Customs
-- >              administration.
-- >         4 High value consignments
-- >              Imported consignments/items/goods which are determined as
-- >              having a value above a certain amount fixed by the
-- >              Customs administration, which may or may not attract
-- >              duties and taxes.
-- > +       5 Other non-containerized
-- >              Non-containerized cargo which cannot be categorized by
-- >              any of the other nature of cargo code.
-- > +       6 Vehicles
-- >              Vehicles which are not stowed in containers.
-- > +       7 Roll-on roll-off
-- >              Cargo transported or to be transported on roll-on roll-
-- >              off vessels and which is transportable on its own wheels
-- >              or stowed on special heavy duty trailers.
-- > +       8 Palletized
-- >              Non-containerized cargo which is palletized.
-- > +       9 Containerized
-- >              Cargo stowed or to be stowed in a container.
-- > +      10 Breakbulk
-- >              Non-containerized cargo stowed in vessels' holds.
simple7085 :: Parser Value
simple7085 = simple "7085" (alphaNumeric `upTo` 3)
