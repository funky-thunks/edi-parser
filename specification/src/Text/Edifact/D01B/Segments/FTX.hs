{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Segments.FTX
  ( -- * Definition
    segmentFTX
    -- * Dependencies
  , compositeC107
  , compositeC108
  , simple3453
  , simple4447
  , simple4451
  , simple4453
  ) where

import           Text.Edifact.D01B.Composites (compositeC107, compositeC108)
import           Text.Edifact.D01B.Simples    (simple3453, simple4447,
                                               simple4451, simple4453)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >        FTX  FREE TEXT
-- >
-- >        Function: To provide free form or coded text information.
-- >
-- > 010    4451 TEXT SUBJECT CODE QUALIFIER                M    1 an..3
-- >
-- > 020    4453 FREE TEXT FUNCTION CODE                    C    1 an..3
-- >
-- > 030    C107 TEXT REFERENCE                             C    1
-- >        4441  Free text value code                      M      an..17
-- >        1131  Code list identification code             C      an..17
-- >        3055  Code list responsible agency code         C      an..3
-- >
-- > 040    C108 TEXT LITERAL                               C    1
-- >        4440  Free text value                           M      an..512
-- >        4440  Free text value                           C      an..512
-- >        4440  Free text value                           C      an..512
-- >        4440  Free text value                           C      an..512
-- >        4440  Free text value                           C      an..512
-- >
-- > 050    3453 LANGUAGE NAME CODE                         C    1 an..3
-- >
-- > 060    4447 FREE TEXT FORMAT CODE                      C    1 an..3
--
-- Dependencies: 'compositeC107', 'compositeC108', 'simple3453', 'simple4447', 'simple4451', 'simple4453'.
segmentFTX :: Parser Value
segmentFTX =
  segment "FTX"
    [ "010" .@ mandatory simple4451
    , "020" .@ optional  simple4453
    , "030" .@ optional  compositeC107
    , "040" .@ optional  compositeC108
    , "050" .@ optional  simple3453
    , "060" .@ optional  simple4447
    ]
