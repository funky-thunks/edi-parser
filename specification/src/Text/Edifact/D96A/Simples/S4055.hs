{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S4055
  ( simple4055
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >   4055  Terms of delivery or transport function, coded
-- >
-- >   Desc: Indication whether the terms relate to e.g. price conditions,
-- >         delivery conditions, transport conditions, or a combination of
-- >         these.
-- >
-- >   Repr: an..3
-- >
-- >         1 Price condition
-- >              Description to be provided.
-- >         2 Despatch condition
-- >              Condition requested by the customer under which the
-- >              supplier shall deliver: Extent of freight costs, means of
-- >              transport.
-- >         3 Price and despatch condition
-- >              Description to be provided.
-- >         4 Collected by customer
-- >              Indicates that the customer will pick up the goods at the
-- >              supplier. He will take care of the means of transport.
-- >         5 Transport condition
-- >              Specifies the conditions under which the transport takes
-- >              place under the responsibility of the carrier.
-- >         6 Delivery condition
-- >              Specifies the conditions under which the goods must be
-- >              delivered to the consignee.
simple4055 :: Parser Value
simple4055 = simple "4055" (alphaNumeric `upTo` 3)
