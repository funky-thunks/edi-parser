{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S4295
  ( simple4295
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- > * 4295  Change reason, coded
-- >
-- >   Desc: Identification of the reason for a change.
-- >
-- >   Repr: an..3
-- >
-- >    AA     Member attribute change
-- >              An attribute of a member of a group has changed.
-- >    AB     Abroad
-- >              In an other country.
-- >    AC     Member category change
-- >              The member or benefits category has changed.
-- >    AD     Death
-- >              Subject has died.
-- >    AE     Disability
-- >              Subject is disabled.
-- >    AF     Early retirement
-- >              Retirement before the normal retirement age.
-- >    AG     Hardship
-- >              Subject is incurring hardship.
-- >    AH     Ill health
-- >              Subject has ill health.
-- >    AI     Leaving employer
-- >              Subject is leaving employer.
-- >    AJ     Leaving industry
-- >              Person is leaving, or has left, an identified industry.
-- >    AK     Level/rate table change
-- >              The insurance level/rate table has changed.
-- >    AL     Normal retirement
-- >              Subject has retired at the normal retirement age.
-- >    AM     Other
-- >              Reason differs from any of the other coded values.
-- >    AN     Retrenchment
-- >              Subject has been retrenched from work.
-- >    AO     Resignation
-- >              Subject has resigned from work.
-- >    AP     Member status change
-- >              The member status has changed.
-- >    AQ     Alternate quantity and unit of measurement
-- >              Self explanatory.
-- > +  AR     Article out of assortment for particular company
-- >              Item normally part of a suppliers standard assortment but
-- >              is unavailable for a specific buyer due to legal or
-- >              commercial reasons.
-- > +  AS     Article out of assortment
-- >              Article normally part of a standard assortment is
-- >              unavailable.
-- > +  AT     Item not ordered
-- >              Code indicating the item or product was not ordered.
-- > +  AU     No delivery due to outstanding payments
-- >              Delivery of an item was stopped due to outstanding
-- >              deliveries which have not yet been paid.
-- > +  AV     Out of inventory
-- >              Item is out of inventory.
-- >    BD     Blueprint deviation
-- >              Self explanatory.
-- >    BQ     Balancing quantity
-- >              Amount needed to resolve difference between ordered and
-- >              delivered quantity.
-- >    DC     Date change
-- >              Self explanatory.
-- >    EV     Estimated quantity
-- >              Self explanatory.
-- >    GU     Gross volume per pack and unit of measure
-- >              Self explanatory.
-- >    GW     Gross weight per pack
-- >              Self explanatory.
-- >    LD     Length difference
-- >              Self explanatory.
-- >    MC     Pack/size measure difference
-- >              Description to be provided.
-- >    PC     Pack difference
-- >              Self-explanatory.
-- >    PD     Pack dimension difference
-- >              Description to be provided.
-- >    PQ     Pack quantity
-- >              Self explanatory.
-- >    PS     Product/services ID change
-- >              Self explanatory.
-- >    PW     Pack weight difference
-- >              Self explanatory.
-- >    PZ     Pack size difference
-- >              Self-explanatory.
-- >    QO     Quantity ordered
-- >              Self explanatory.
-- >    QP     Quantity based on price qualifier
-- >              Self explanatory.
-- >    QT     Quantity price break
-- >              Self explanatory.
-- >    SC     Size difference
-- >              Self explanatory.
-- >    UM     Unit of measure difference
-- >              Self explanatory.
-- >    UP     Unit price
-- >              Self explanatory.
-- >    WD     Width difference
-- >              Self explanatory.
-- >    WO     Weight qualifier/gross weight per package
-- >              Self explanatory.
-- >    ZZZ    Mutually defined
-- >              Self explanatory.
simple4295 :: Parser Value
simple4295 = simple "4295" (alphaNumeric `upTo` 3)
