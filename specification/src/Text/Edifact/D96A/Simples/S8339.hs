{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Simples.S8339
  ( simple8339
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >   8339  Packing group, coded
-- >
-- >   Desc: Identification of a packing group by code.
-- >
-- >   Repr: an..3
-- >
-- >         1 Great danger
-- >              Packaging meeting criteria to pack hazardous materials
-- >              with great danger. Group I according to IATA/IMDG/ADR/RID
-- >              regulations.
-- >         2 Medium danger
-- >              Packaging meeting criteria to pack hazardous materials
-- >              with great danger. Group II according to
-- >              IATA/IDMG/ADR/RID regulations.
-- >         3 Minor danger
-- >              Packaging meeting criteria to pack hazardous materials
-- >              with great danger. Group III according to
-- >              IATA/IDMG/ADR/RID regulations.
simple8339 :: Parser Value
simple8339 = simple "8339" (alphaNumeric `upTo` 3)
