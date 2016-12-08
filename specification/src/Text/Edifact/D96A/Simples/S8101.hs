{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S8101
  ( simple8101
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >   8101  Transit direction, coded
-- >
-- >   Desc: Identification of the point of origin and point of direction.
-- >
-- >   Repr: an..3
-- >
-- >    BS     Buyer to seller
-- >              Self explanatory.
-- >    SB     Seller to buyer
-- >              Self explanatory.
-- >    SC     Subcontractor to seller
-- >              Self explanatory.
-- >    SD     Seller to drop ship designated location
-- >              Self explanatory.
-- >    SF     Seller to freight forwarder
-- >              Self explanatory.
-- >    SS     Seller to subcontractor
-- >              Self explanatory.
-- >    ZZZ    Mutually defined
-- >              Self explanatory.
simple8101 :: Parser Value
simple8101 = simple "8101" (alphaNumeric `upTo` 3)
