{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C522
  ( -- * Definition
    compositeC522
    -- * Dependencies
  , simple1131
  , simple3055
  , simple4400
  , simple4401
  , simple4403
  ) where

import           Text.Edifact.D96A.Simples (simple1131, simple3055, simple4400,
                                            simple4401, simple4403)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C522  INSTRUCTION
-- >
-- >       Desc: To specify an instruction.
-- >
-- > 010   4403   Instruction qualifier                         M  an..3
-- > 020   4401   Instruction, coded                            C  an..3
-- > 030   1131   Code list qualifier                           C  an..3
-- > 040   3055   Code list responsible agency, coded           C  an..3
-- > 050   4400   Instruction                                   C  an..35
--
-- Dependencies: 'simple1131', 'simple3055', 'simple4400', 'simple4401', 'simple4403'.
compositeC522 :: Parser Value
compositeC522 =
  composite "C522"
    [ "010" .@ mandatory simple4403
    , "020" .@ optional  simple4401
    , "030" .@ optional  simple1131
    , "040" .@ optional  simple3055
    , "050" .@ optional  simple4400
    ]
