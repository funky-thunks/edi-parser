{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S8179
  ( simple8179
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- > *    8179  Transport means description code                        [C]
-- >
-- >      Desc: Code specifying the means of transport.
-- >
-- >      Repr: an..8
-- >
-- >      1     Barge chemical tanker
-- >               A barge equipped to transport liquid chemicals.
-- >
-- >      2     Coaster chemical tanker
-- >               A coaster vessel equipped to transport liquid chemicals.
-- >
-- >      3     Dry bulk carrier
-- >               Vessel designed to carry dry bulk (expellers).
-- >
-- >      4     Deep sea chemical tanker
-- >               An ocean-going vessel equipped to transport liquid
-- >               chemicals.
-- >
-- >      5     Gas tanker
-- >               A vessel equipped to transport gas.
-- >
-- >      6     Aircraft
-- >               A machine capable of flight.
-- >
-- >      7     Car with caravan
-- >               A caravan towed by a car.
-- >
-- >      8     Container ship
-- >               Vessel capable of carrying containers and other cargo.
-- >
-- >      9     Exceptional transport
-- >               Transport for which common characteristics are not
-- >               applicable (e.g. big transformers requiring special
-- >               wagons, special tackles, special routing etc.).
-- >
-- >      10    Bus
-- >               To specify that the means of transportation is a bus.
-- >
-- >      11    Ship
-- >               A large vessel navigating deep water.
-- >
-- >      12    Ship tanker
-- >               A large vessel equipped to transport liquids.
-- >
-- >      13    Ocean vessel
-- >               An ocean-going vessel that is not a ship.
-- >
-- > X    14    Flatbed trailer
-- >               A means of transport identification code indicating a
-- >               flatbed trailer.
-- >
-- >            Note:
-- >               1. This code value will be removed effective with
-- >               directory D.02B.
-- >
-- >      15    Taxi
-- >               A means of transport identification code indicating a
-- >               taxi.
-- >
-- >      16    Barge
-- >               A category of boat used to transport material over
-- >               water.
-- >
-- >      17    Customer determined means of transport
-- >               The type of means of transport is to be determined by
-- >               the customer.
-- >
-- >      18    Seller determined means of transport
-- >               The type of means of transport is to be determined by
-- >               the seller.
-- >
-- >      19    Tip-up truck
-- >               A truck capable of tipping up in order to deliver its
-- >               load.
-- >
-- >      20    Furniture truck
-- >               A truck used explicitly for the conveyance of furniture.
-- >
-- >      21    Rail tanker
-- >               A rail wagon equipped to transport liquids.
-- >
-- > X    22    Rail silo tanker
-- >               Self explanatory.
-- >
-- >            Note:
-- >               1. This code value will be removed effective with
-- >               directory D.04B.
-- >
-- >      23    Rail bulk car
-- >               A rail wagon equipped to transport bulk cargo.
-- >
-- >      24    Customer rail tanker
-- >               A customer-owned rail wagon equipped to transport
-- >               liquids.
-- >
-- > X    25    Rail express
-- >               Description to be provided.
-- >
-- >            Note:
-- >               1. This code value will be removed effective with
-- >               directory D.04B.
-- >
-- >      26    Tip-up articulated truck
-- >               An articulated truck capable of tipping up in order to
-- >               deliver its load.
-- >
-- >      27    Rigid truck with tank
-- >               A rigid truck fitted with a tank capable of carrying
-- >               liquids or bulk goods.
-- >
-- >      28    Refrigerated truck and trailer
-- >               A combined truck and trailer equipped to maintain
-- >               refrigerated temperatures.
-- >
-- >      29    Freezer truck and trailer
-- >               A combined truck and trailer equipped to maintain
-- >               freezing temperatures.
-- >
-- >      30    Tautliner 25 tonne, combined with 90 cubic meter trailer
-- >            with removable roof
-- >               A truck with non-ridged sides, 25 tonne capacity
-- >               combined with a 90 cubic meter trailer with removable
-- >               roof.
-- >
-- >      31    Truck
-- >               An automotive vehicle for hauling goods.
-- >
-- >      32    Road tanker
-- >               An over-the-road tank trucker or trailer.
-- >
-- > X    33    Road silo tanker
-- >               Description to be provided.
-- >
-- >            Note:
-- >               1. This code value will be removed effective with
-- >               directory D.04B.
-- >
-- >      34    Tautliner truck
-- >               A truck with non-ridged sides.
-- >
-- >      35    Truck/trailer with tilt
-- >               A truck and trailer combination with a tilting
-- >               capability.
-- >
-- >      36    Pipeline
-- >               A line of pipes for conveying water, gas, oil, etc.
-- >
-- >      37    Hydrant cart
-- >               Vehicle used at large airports with installed
-- >               distribution systems to make into-plane deliveries of
-- >               fuel; distinguished from other types of fuelling
-- >               vehicles.
-- >
-- >      38    Car
-- >               Car.
-- >
-- >      39    Tautliner truck with removable roof
-- >               A truck with non-ridged sides and removable roof.
-- >
-- >      40    Truck with opening floor
-- >               A truck with an opening floor mechanism which is used to
-- >               discharge the cargo.
-- >
-- >      41    Freezer truck
-- >               A truck equipped to maintain freezing temperatures.
-- >
-- >      42    Isothermic truck
-- >               A truck equipped to maintain controlled temperatures.
-- >
-- >      43    Refrigerated truck
-- >               A truck equipped to maintain refrigerated temperatures.
-- >
-- >      44    Freezer van
-- >               A small rigid covered vehicle for conveying frozen
-- >               goods.
-- >
-- >      45    Isothermic van
-- >               A small rigid covered vehicle for conveying temperature
-- >               controlled goods.
-- >
-- >      46    Refrigerated van
-- >               A small rigid covered vehicle for conveying refrigerated
-- >               goods.
-- >
-- >      47    Bulk truck
-- >               A truck suitable for transporting bulk goods.
-- >
-- >      48    Van
-- >               A small vehicle suitable for carrying small volume
-- >               loads.
-- >
-- >      49    Roadrailer
-- >               Used for shipments that travel by multimodal rail or
-- >               highway trailer (roadrailer).
-- >
-- >      50    Passenger vessel
-- >               Vessel for carrying passengers.
-- >
-- >      51    Cargo and passenger vessel
-- >               Vessel for carrying cargo and passengers.
-- >
-- >      52    General cargo vessel
-- >               Vessel for carrying general cargo.
-- >
-- >      53    Crude oil tanker
-- >               Vessel for carrying crude oil.
-- >
-- >      54    Liquefied Petroleum Gas (LPG) carrier
-- >               Vessel for carrying Liquefied Petroleum Gas (LPG).
-- >
-- >      55    Liquefied Natural Gas (LNG) carrier
-- >               Vessel for carrying Liquefied Natural Gas (LNG).
-- >
-- >      56    Grain carrier
-- >               Vessel for carrying grain.
-- >
-- >      57    Timber or log carrier
-- >               Vessel for carrying timber or logs.
-- >
-- >      58    Wood chip carrier
-- >               Vessel for carrying wood chips.
-- >
-- >      59    Steel products vessel
-- >               Vessel for carrying steel products.
-- >
-- >      60    Gravel vessel
-- >               Vessel for carrying gravel.
-- >
-- >      61    Cement vessel
-- >               Vessel for carrying cement in bulk.
-- >
-- >      62    Coal vessel
-- >               Vessel for carrying coal.
-- >
-- >      63    Ore carrier
-- >               Vessel for carrying ore in bulk.
-- >
-- >      64    Car carrier
-- >               Vessel for carrying complete cars and/or their knock-
-- >               down parts.
-- >
-- >      65    Container only vessel
-- >               Vessel for carrying containers only.
-- >
-- >      66    Roll on - roll off vessel
-- >               A vessel capable of carrying roll on - roll off cargo.
-- >
-- >      67    Ferry
-- >               A means of transport for carrying passengers and/or
-- >               vehicles on a regular basis.
-- >
-- >      68    Fishing vessel
-- >               Vessel used in the catching of fish.
-- >
-- >      69    Work vessel
-- >               A vessel engaged in "port and harbour work", which means
-- >               construction, improvement, maintenance or rehabilitation
-- >               of port and harbour facilities. Dredger, floating crane,
-- >               sand carrier with grab bucket are included in this type
-- >               of the means of transport.
-- >
-- >      70    Patrol vessel
-- >               A vessel to patrol port or coastal area.
-- >
-- >      71    Tug and/or push boat
-- >               A vessel to push and/or pull other vessels.
-- >
-- >      72    Train with one wagon
-- >               A train with a single wagon used to carry goods.
-- >
-- >      73    Train with more than one and less than 20 wagons
-- >               A train with more than one and less than 20 wagons used
-- >               to carry goods.
-- >
-- >      74    Train with 20 or more wagons
-- >               A train with 20 or more wagons used to carry goods.
-- >
-- >      75    Oil products tanker
-- >               A vessel for carrying products derived from crude oil.
-- >
-- >      76    Training vessel
-- >               A vessel for learning maritime skills.
-- >
-- >      77    Freezer truck and isothermic trailer
-- >               A combined freezer truck and isothermic trailer.
-- >
-- >      78    Isothermic truck and isothermic trailer
-- >               A truck and a trailer equipped to maintain controlled
-- >               temperatures.
-- >
-- >      79    Refrigerated truck and isothermic trailer
-- >               A combined refrigerated truck and isothermic trailer.
-- >
-- >      80    Freezer truck and refrigerated trailer
-- >               A combined freezer truck and refrigerated trailer.
-- >
-- >      81    Isothermic truck and refrigerated trailer
-- >               A combined isothermic truck and refrigerated trailer.
-- >
-- >      82    Rigid truck with tank and tank trailer
-- >               A combined rigid truck with tank and tank trailer.
-- >
-- >      83    Bulk truck and tank trailer
-- >               A combined truck capable of carrying liquids or bulk
-- >               goods and a tank trailer.
-- >
-- >      84    Rigid truck with tank and bulk trailer
-- >               A combined rigid truck with tank and a trailer capable
-- >               of carrying liquids or bulk goods.
-- >
-- >      85    Bulk truck and bulk trailer
-- >               A combined truck and a trailer both capable of carrying
-- >               liquids or bulk goods.
-- >
-- >      86    Tautliner truck and extendable trailer
-- >               A combined tautliner truck and extendable trailer.
-- >
-- >      87    Tautliner truck with removable roof and extendable trailer
-- >               A combined tautliner truck with removable roof and
-- >               extendable trailer.
-- >
-- >      88    Truck with opening floor and extendable trailer
-- >               A combined truck with opening floor and extendable
-- >               trailer.
-- >
-- >      89    Bulk truck and extendable trailer
-- >               A combined truck capable of carrying liquids or bulk
-- >               goods and an extendable trailer.
-- >
-- >      90    Isothermic truck and freezer trailer
-- >               A combined isothermic truck and freezer trailer.
-- >
-- >      91    Refrigerated truck and freezer trailer
-- >               A combined refrigerated truck and freezer trailer.
-- >
-- >      92    Tip-up truck and gondola trailer
-- >               A combined tip-up truck and gondola trailer. A gondola
-- >               trailer is a split level trailer suitable for the
-- >               transport of heavy machinery.
-- >
-- >      93    Tautliner truck and gondola trailer
-- >               A combined tautliner truck and gondola trailer. A
-- >               gondola trailer is a split level trailer suitable for
-- >               the transport of heavy machinery.
-- >
-- >      94    Tautliner truck with removable roof and gondola trailer
-- >               A combined tautliner truck with removable roof and
-- >               gondola trailer. A gondola trailer is a split level
-- >               trailer suitable for the transport of heavy machinery.
-- >
-- >      95    Truck with opening floor and gondola trailer
-- >               A combined truck with opening floor and gondola trailer.
-- >               A gondola trailer is a split level trailer suitable for
-- >               the transport of heavy machinery.
-- >
-- >      96    Bulk truck and gondola trailer
-- >               A combined truck capable of carrying liquids or bulk
-- >               goods and a gondola trailer. A gondola trailer is a
-- >               split level trailer suitable for the transport of heavy
-- >               machinery.
-- >
-- >      97    Tip-up truck and extendable gondola trailer
-- >               A combined tip-up truck with extendable gondola trailer.
-- >               An extendable gondola trailer is a trailer fitted with a
-- >               rear axle which can be extended to cater for variable
-- >               length and is suitable for the transport of heavy
-- >               machinery.
-- >
-- >      98    Tautliner truck and extendable gondola trailer
-- >               A combined tautliner truck and extendable gondola
-- >               trailer. An extendable gondola trailer is a trailer
-- >               fitted with a rear axle which can be extended to cater
-- >               for variable length and is suitable for the transport of
-- >               heavy machinery.
-- >
-- >      99    Tautliner truck with removable roof and extendable gondola
-- >            trailer
-- >               A combined tautliner truck with removable roof and
-- >               extendable gondola trailer. An extendable gondola
-- >               trailer is a trailer fitted with a rear axle which can
-- >               be extended to cater for variable length and is suitable
-- >               for the transport of heavy machinery.
-- >
-- >      100   Truck with opening floor and extendable gondola trailer
-- >               A combined truck with opening floor and extendable
-- >               gondola trailer. An extendable gondola trailer is a
-- >               trailer fitted with a rear axle which can be extended to
-- >               cater for variable length and is suitable for the
-- >               transport of heavy machinery.
-- >
-- >      101   Bulk truck and extendable gondola trailer
-- >               A combined truck capable of carrying liquids or bulk
-- >               goods and a extendable gondola trailer. An extendable
-- >               gondola trailer is a trailer fitted with a rear axle
-- >               which can be extended to cater for variable length and
-- >               is suitable for the transport of heavy machinery.
-- >
-- >      102   Tip-up truck and trailer with opening floor
-- >               A combined tip-up truck and trailer with opening floor.
-- >
-- >      103   Tautliner truck and trailer with opening floor
-- >               A combined tautliner truck and trailer with opening
-- >               floor.
-- >
-- >      104   Tautliner truck with removable roof and trailer with
-- >            opening floor
-- >               A combined tautliner truck with removable roof and
-- >               trailer with opening floor.
-- >
-- >      105   Truck and trailer with opening floor
-- >               A combined truck and a trailer with an opening floor.
-- >
-- >      106   Bulk truck and trailer with opening floor
-- >               A combined truck capable of carrying liquids or bulk
-- >               goods and a trailer with opening floor.
-- >
-- >      107   Removal truck and trailer
-- >               A combined truck and trailer capable of carrying
-- >               household effects.
-- >
-- >      108   Tautliner truck and removal trailer
-- >               A combined tautliner truck and trailer capable of
-- >               carrying household effects.
-- >
-- >      109   Tautliner truck with removable roof and removal trailer
-- >               A combined tautliner truck with a removable roof and a
-- >               trailer capable of carrying household effects.
-- >
-- >      110   Vessel, temperature controlled cargo
-- >               A vessel to carry temperature controlled cargo.
simple8179 :: Parser Value
simple8179 = simple "8179" (alphaNumeric `upTo` 8)