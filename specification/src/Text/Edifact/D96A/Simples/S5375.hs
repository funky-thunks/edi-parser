{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S5375
  ( simple5375
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- > * 5375  Price type, coded
-- >
-- >   Desc: Code identifying the type of price of an item.
-- >
-- >   Repr: an..3
-- >
-- >    AA     Cancellation price
-- >              Price authorized to be charged in the event of an order
-- >              being cancelled.
-- >    AB     Per ton
-- >              To indicate that the price applies per ton.
-- > +  AC     Minimum order price
-- >              A code to identify the price when the minimum number is
-- >              purchased.
-- > +  AD     Export price
-- >              A code to identify the price of a given article for the
-- >              export market.
-- > +  AE     Range dependent price
-- >              A code identifying the price for a specific range of
-- >              purchase quantities.
-- >    AI     Active ingredient
-- >              The price is referring to the active ingredient.
-- >    AQ     As is quantity
-- >              The price is referring to the measured quantity.
-- >    CA     Catalogue
-- >              Self explanatory.
-- >    CT     Contract
-- >              Self explanatory.
-- >    CU     Consumer unit
-- >              The price is referring to the consumer unit.
-- >    DI     Distributor
-- >              Self explanatory.
-- >    EC     ECSC price
-- >              Price registered at European Commission Steel and Carbon
-- >              office (DG III).
-- >    NW     Net weight
-- >              Self explanatory.
-- >    PC     Price catalogue
-- >              Self explanatory.
-- >    PE     Per each
-- >              Self explanatory.
-- >    PK     Per kilogram
-- >              Self explanatory.
-- >    PL     Per litre
-- >              Self explanatory.
-- >    PT     Per tonne
-- >              Self explanatory.
-- >    PU     Specified unit
-- >              Self explanatory.
-- >    PV     Provisional price
-- >              Self explanatory.
-- >    PW     Gross weight
-- >              Self explanatory.
-- >    QT     Quoted
-- >              Self explanatory.
-- >    SR     Suggested retail
-- >              Self explanatory.
-- >    TB     To be negotiated
-- >              Self explanatory.
-- >    TU     Traded unit
-- >              The price is referring to the traded unit.
-- >    TW     Theoretical weight
-- >              Weight calculated on ordered dimension (length, width,
-- >              thickness) not on final dimension (e.g. steel products).
-- >    WH     Wholesale
-- >              Self explanatory.
simple5375 :: Parser Value
simple5375 = simple "5375" (alphaNumeric `upTo` 3)
