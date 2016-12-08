{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S9417
  ( simple9417
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >   9417  Government action, coded
-- >
-- >   Desc: To indicate type of government action such as inspection,
-- >         detention, fumigation, security.
-- >
-- >   Repr: an..3
-- >
-- >         1 Clearance
-- >              The cargo will be or has been cleared.
-- >         2 Detention
-- >              The cargo has been or will be detained.
-- >         3 Fumigation
-- >              The cargo has been or will be fumigated.
-- >         4 Inspection
-- >              The cargo has been or will be inspected.
-- >         5 Security
-- >              The cargo has been or will be secured.
simple9417 :: Parser Value
simple9417 = simple "9417" (alphaNumeric `upTo` 3)
