{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S8339
  ( simple8339
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      8339  Packaging danger level code                             [B]
-- >
-- >      Desc: Code specifying the level of danger for which the
-- >            packaging must cater.
-- >
-- >      Repr: an..3
-- >
-- >      1     Great danger
-- >               Packaging meeting criteria to pack hazardous materials
-- >               with great danger. Group I according to
-- >               IATA/IMDG/ADR/RID regulations.
-- >
-- >      2     Medium danger
-- >               Packaging meeting criteria to pack hazardous materials
-- >               with medium danger. Group II according to
-- >               IATA/IDMG/ADR/RID regulations.
-- >
-- >      3     Minor danger
-- >               Packaging meeting criteria to pack hazardous materials
-- >               with minor danger. Group III according to
-- >               IATA/IDMG/ADR/RID regulations.
simple8339 :: Parser Value
simple8339 = simple "8339" (alphaNumeric `upTo` 3)
