{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Segments.DTM
  ( -- * Definition
    segmentDTM
    -- * Dependencies
  , compositeC507
  ) where

import           Text.Edifact.D01B.Composites (compositeC507)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >        DTM  DATE/TIME/PERIOD
-- >
-- >        Function: To specify date, and/or time, or period.
-- >
-- > 010    C507 DATE/TIME/PERIOD                           M    1
-- >        2005  Date or time or period function code
-- >              qualifier                                 M      an..3
-- >        2380  Date or time or period value              C      an..35
-- >        2379  Date or time or period format code        C      an..3
--
-- Dependencies: 'compositeC507'.
segmentDTM :: Parser Value
segmentDTM =
  segment "DTM"
    [ "010" .@ mandatory compositeC507
    ]
