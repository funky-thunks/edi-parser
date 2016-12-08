{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S6245
  ( simple6245
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >   6245  Temperature qualifier
-- >
-- >   Desc: A code giving specific meaning to the temperature.
-- >
-- >   Repr: an..3
-- >
-- >         1 Storage temperature
-- >              The temperature at which the cargo is to be kept while it
-- >              is in storage.
-- >         2 Transport temperature
-- >              The temperature at which cargo is to be kept while it is
-- >              under transport.
-- >         3 Cargo operating temperature
-- >              The temperature at which cargo is to be kept during cargo
-- >              handling.
-- >         4 Transport emergency temperature
-- >              The temperature at which emergency procedures apply for
-- >              the disposal of temperature-controlled goods.
-- >         5 Transport control temperature
-- >              The maximum temperature at which certain products can be
-- >              safely transported.
simple6245 :: Parser Value
simple6245 = simple "6245" (alphaNumeric `upTo` 3)
