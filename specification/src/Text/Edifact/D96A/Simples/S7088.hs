{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S7088
  ( simple7088
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >    7088  Dangerous goods flashpoint
-- >
-- >    Desc: Lowest temperature, in the case of dangerous goods, at which
-- >          vapour from an inflammable liquid forms an ignitable mixture
-- >          with air.
-- >
-- >    Repr: an..8
simple7088 :: Parser Value
simple7088 = simple "7088" (alphaNumeric `upTo` 8)
