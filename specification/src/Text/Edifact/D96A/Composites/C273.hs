{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C273
  ( -- * Definition
    compositeC273
    -- * Dependencies
  , simple1131
  , simple3055
  , simple3453
  , simple7008
  , simple7009
  ) where

import           Text.Edifact.D96A.Simples (simple1131, simple3055, simple3453,
                                            simple7008, simple7009)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >    *| C273  ITEM DESCRIPTION
-- >
-- >     | Desc: Description of an item.
-- >
-- > 010   7009   Item description identification               C  an..17
-- > 020   1131   Code list qualifier                           C  an..3
-- > 030   3055   Code list responsible agency, coded           C  an..3
-- > 040   7008   Item description                              C  an..35
-- > 050   7008   Item description                              C  an..35
-- > 060 + 3453   Language, coded                               C  an..3
--
-- Dependencies: 'simple1131', 'simple3055', 'simple3453', 'simple7008', 'simple7009'.
compositeC273 :: Parser Value
compositeC273 =
  composite "C273"
    [ "010" .@ optional  simple7009
    , "020" .@ optional  simple1131
    , "030" .@ optional  simple3055
    , "040" .@ optional  simple7008
    , "050" .@ optional  simple7008
    , "060" .@ optional  simple3453
    ]
