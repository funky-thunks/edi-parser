{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S4053
  ( simple4053
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      4053  Delivery or transport terms description code            [B]
-- >
-- >      Desc: Code specifying the delivery or transport terms.
-- >
-- >      Repr: an..3
-- >
-- >      1     Delivery arranged by the supplier
-- >               Indicates that the supplier will arrange delivery of the
-- >               goods.
-- >
-- >      2     Delivery arranged by logistic service provider
-- >               Code indicating that the logistic service provider has
-- >               arranged the delivery of goods.
simple4053 :: Parser Value
simple4053 = simple "4053" (alphaNumeric `upTo` 3)
