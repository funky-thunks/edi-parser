{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C108
  ( -- * Definition
    compositeC108
    -- * Dependencies
  , simple4440
  ) where

import           Text.Edifact.D96A.Simples (simple4440)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >       C108  TEXT LITERAL
-- >
-- >       Desc: Free text; one to five lines.
-- >
-- > 010   4440   Free text                                     M  an..70
-- > 020   4440   Free text                                     C  an..70
-- > 030   4440   Free text                                     C  an..70
-- > 040   4440   Free text                                     C  an..70
-- > 050   4440   Free text                                     C  an..70
--
-- Dependencies: 'simple4440'.
compositeC108 :: Parser Value
compositeC108 =
  composite "C108"
    [ "010" .@ mandatory simple4440
    , "020" .@ optional  simple4440
    , "030" .@ optional  simple4440
    , "040" .@ optional  simple4440
    , "050" .@ optional  simple4440
    ]
