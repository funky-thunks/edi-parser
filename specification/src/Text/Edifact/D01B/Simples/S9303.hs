{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S9303
  ( simple9303
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- >      9303  Sealing party name code                                 [B]
-- >
-- >      Desc: Code specifying the name of the sealing party.
-- >
-- >      Repr: an..3
-- >
-- >      AA    Consolidator
-- >               Party which consolidates cargo.
-- >
-- >      AB    Unknown
-- >               The sealing party is unknown.
-- >
-- >      AC    Quarantine agency
-- >               Agency responsible for the administration of statutory
-- >               disease controls on the movement of people, animals and
-- >               plants.
-- >
-- >      CA    Carrier
-- >               Party undertaking or arranging transport of goods
-- >               between named points.
-- >
-- >      CU    Customs
-- >               'Customs' means the Government Service which is
-- >               responsible for the administration of Customs law and
-- >               the collection of duties and taxes and which also has
-- >               the responsibility for the application of other laws and
-- >               regulations relating to the importation, exportation,
-- >               movement or storage of goods.
-- >
-- >      SH    Shipper
-- >               Party which, by contract with a carrier, consigns or
-- >               sends goods with the carrier, or has them conveyed by
-- >               him.
-- >
-- >      TO    Terminal operator
-- >               Party which handles the loading and unloading of marine
-- >               vessels.
simple9303 :: Parser Value
simple9303 = simple "9303" (alphaNumeric `upTo` 3)
