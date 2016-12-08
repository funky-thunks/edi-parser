{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S7233
  ( simple7233
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      7233  Packaging related description code                      [B]
-- >
-- >      Desc: Code specifying information related to packaging.
-- >
-- >      Repr: an..3
-- >
-- >      1     Product ingredients not marked on package
-- >               The ingredients of the product are not marked on the
-- >               packaging of the product.
-- >
-- >      2     Product price not marked on packaging
-- >               The product price is not marked on the packaging of the
-- >               product.
-- >
-- >      3     Product best before date not marked on product package
-- >               The product best before date is not marked on the
-- >               packaging of the product.
-- >
-- >      4     Package not marked recyclable
-- >               Package is not marked as recyclable.
-- >
-- >      5     Promotional details marked
-- >               A code indicating that promotional details have been
-- >               marked on the package.
-- >
-- >      31    Package best before date marked
-- >               Package is marked with the product best before date.
-- >
-- >      32    Package marked recyclable
-- >               The package is marked recyclable.
-- >
-- >      33    Package marked returnable
-- >               The package is marked returnable.
-- >
-- >      34    Product marking
-- >               The information is related to product marking.
-- >
-- >      35    Type of package
-- >               The information is related to the type of package.
-- >
-- >      36    Package specifications
-- >               The information specifies the package.
-- >
-- >      37    Package protection
-- >               The information is related to protection of the package.
-- >
-- >      38    Tarping
-- >               The information describes how coverage with tarpaulins
-- >               is to be provided.
-- >
-- >      39    Platform/skid location
-- >               The information describes the platform or skid location.
-- >
-- >      40    Bearing piece location
-- >               The information gives the location of the load bearing
-- >               piece.
-- >
-- >      41    Skid/pallet type
-- >               The information describes the type of skid or pallet.
-- >
-- >      42    Placement on carrier
-- >               The information describes the placement on the carrier.
-- >
-- >      43    Spacing directions
-- >               Descriptions to be provided.
-- >
-- >      44    Unloading device
-- >               The information specifies the unloading device which
-- >               must be used to handle the package.
-- >
-- >      45    Unloading equipment
-- >               The information specifies the unloading equipment which
-- >               must be used to handle the package.
-- >
-- >      50    Package barcoded EAN-13 or EAN-8
-- >               The package is barcoded with EAN-13 or EAN-8 code.
-- >
-- >      51    Package barcoded ITF-14 or ITF-6
-- >               The package is barcoded with ITF-14 or ITF-6 code.
-- >
-- >      52    Package barcoded UCC or EAN-128
-- >               The package is barcoded with UCC or EAN-128 code.
-- >
-- >      53    Package price marked
-- >               The package is marked with the price.
-- >
-- >      54    Product ingredients marked on package
-- >               The ingredients of the product contained in a package
-- >               are marked on that package.
-- >
-- >      55    Core characteristics
-- >               Specifies the characteristics of the core of the
-- >               package.
-- >
-- >      56    Shipping requirement
-- >               The packaging as per shipping requirement.
-- >
-- >      57    Customs requirement
-- >               The packaging as per Customs requirement.
-- >
-- >      58    Transport contract requirement
-- >               The packaging as per transport contract requirement.
-- >
-- >      59    Preservation method
-- >               The packaging related information is for methods of
-- >               preservation.
-- >
-- >      60    Product marking pattern
-- >               The information describes the pattern used to mark the
-- >               product.
-- >
-- >      61    Product marking location
-- >               The information provides the location of the product
-- >               marking.
-- >
-- >      62    Package/container mark location
-- >               The information provides the location of a package or
-- >               container mark.
-- >
-- >      63    Marking method
-- >               The information details the marking method.
-- >
-- >      66    Receiving facility limitations
-- >               The information describes limitations which apply to a
-- >               receiving facility.
-- >
-- >      67    Tagging/bar code instructions
-- >               The information provides instructions as to how a
-- >               package is to be tagged or have a bar code applied to
-- >               it.
-- >
-- >      68    Shipping package labelling
-- >               The labelling of a package in which goods are shipped.
-- >
-- >      69    Shipping package sealing
-- >               The sealing particulars of a package in which goods are
-- >               shipped.
-- >
-- >      70    Optional packaging procedure
-- >               To indicate an optional procedure for packaging.
-- >
-- >      71    Cleaning or drying specification
-- >               Identification of the cleaning or drying specification.
-- >
-- >      72    Cushioning thickness specification
-- >               Identification of the cushioning thickness
-- >               specification.
-- >
-- >      73    Cushioning and dunnage specification
-- >               Identification of the cushioning and dunnage
-- >               specification.
-- >
-- >      74    Level of preservation specification
-- >               Identification of the level of preservation
-- >               specification.
-- >
-- >      75    Preservation material specification
-- >               Identification of the preservation material
-- >               specification.
-- >
-- >      76    Unit container specification
-- >               Identification of the unit container specification.
-- >
-- >      77    Material wrapping specification
-- >               Identification of the material wrapping specification.
simple7233 :: Parser Value
simple7233 = simple "7233" (alphaNumeric `upTo` 3)