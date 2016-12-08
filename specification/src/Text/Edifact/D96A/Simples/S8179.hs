{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S8179
  ( simple8179
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- > * 8179  Type of means of transport identification
-- >
-- >   Desc: Code defining the type of the means of transport being
-- >         utilized.
-- >
-- >   Repr: an..8
-- >
-- >         1 Barge chemical tanker
-- >              Self explanatory.
-- >         2 Coaster chemical tanker
-- >              Self explanatory.
-- >         3 Dry bulk carrier
-- >              Self explanatory.
-- >         4 Deep sea chemical tanker
-- >              Self explanatory.
-- >         5 Gas tanker
-- >              Self explanatory.
-- >         6 Aircraft
-- >              Self explanatory.
-- > +       7 Car with caravan
-- >              A caravan towed by a car.
-- >         9 Exceptional transport
-- >              Transport for which common characteristics are not
-- >              applicable (e.g. big transformers requiring special
-- >              wagons, special tackles, special routing etc.).
-- >        11 Ship
-- >              Self explanatory.
-- >        12 Ship tanker
-- >              Self explanatory.
-- >        13 Ocean vessel
-- >              Self explanatory.
-- >        21 Rail tanker
-- >              Self explanatory.
-- >        22 Rail silo tanker
-- >              Self explanatory.
-- >        23 Rail bulk car
-- >              Self explanatory.
-- >        24 Customer rail tanker
-- >              Description to be provided.
-- >        25 Rail express
-- >              Description to be provided.
-- >        31 Truck
-- >              Self explanatory.
-- >        32 Road tanker
-- >              An over-the-road tank trucker or trailer.
-- >        33 Road silo tanker
-- >              Description to be provided.
-- >        35 Truck/trailer with tilt
-- >              Self explanatory.
-- >        36 Pipeline
-- >              A line of pipes for conveying water, gas, oil, etc.
-- >        37 Hydrant cart
-- >              Vehicle used at large airports with installed
-- >              distribution systems to make into-plane deliveries of
-- >              fuel; distinguished from other types of fuelling
-- >              vehicles.
-- > +      38 Car
-- >              Car.
simple8179 :: Parser Value
simple8179 = simple "8179" (alphaNumeric `upTo` 8)
