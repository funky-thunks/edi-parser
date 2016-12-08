{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S4053
  ( simple4053
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    4053  Terms of delivery or transport, coded
-- >
-- >    Desc: Identification of the terms agreed between two parties (e.g.
-- >          seller/buyer, shipper/carrier) under which a product or
-- >          service is provided.
-- >
-- >    Repr: an..3
-- >
-- >    Note: Use UN/ECE Recommendation No. 5 Incoterms 1990.  If not
-- >          applicable, use appropriate code set in combination with
-- >          1131/3055.
simple4053 :: Parser Value
simple4053 = simple "4053" (alphaNumeric `upTo` 3)
