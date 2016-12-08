{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S8101
  ( simple8101
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      8101  Transit direction indicator code                        [B]
-- >
-- >      Desc: Code specifying the direction of transport.
-- >
-- >      Repr: an..3
-- >
-- >      BS    Buyer to seller
-- >               Self explanatory.
-- >
-- >      SB    Seller to buyer
-- >               The transport from the seller to the buyer.
-- >
-- >      SC    Subcontractor to seller
-- >               The transport from the subcontractor to the seller.
-- >
-- >      SD    Seller to drop ship designated location
-- >               The transport from the seller to the drop ship
-- >               designated location.
-- >
-- >      SF    Seller to freight forwarder
-- >               The transport from the seller to the freight forwarder.
-- >
-- >      SS    Seller to subcontractor
-- >               The transport from the seller to the subcontractor.
-- >
-- >      ST    Mother vessel to lighter
-- >               Cargo is transferred from the main carriage or mother
-- >               vessel to a lighter.
-- >
-- >      SU    Lighter to mother vessel
-- >               Cargo is transferred from the lighter vessel to a main
-- >               carriage or mother vessel.
-- >
-- >      ZZZ   Mutually defined
-- >               A code assigned within a code list to be used on an
-- >               interim basis and as defined among trading partners
-- >               until a precise code can be assigned to the code list.
simple8101 :: Parser Value
simple8101 = simple "8101" (alphaNumeric `upTo` 3)
