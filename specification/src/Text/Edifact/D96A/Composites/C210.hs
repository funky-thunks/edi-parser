{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D96A.Composites.C210
  ( -- * Definition
    compositeC210
    -- * Dependencies
  , simple7102
  ) where

import           Text.Edifact.D96A.Simples (simple7102)

import           Text.Edifact.Parsing
import           Text.Edifact.Types        (Value)

-- | Derived from this specification:
--
-- >     | C210  MARKS & LABELS
-- >
-- >     | Desc: Shipping marks on packages in free text; one to ten lines.
-- >
-- > 010   7102   Shipping marks                                M  an..35
-- > 020   7102   Shipping marks                                C  an..35
-- > 030   7102   Shipping marks                                C  an..35
-- > 040   7102   Shipping marks                                C  an..35
-- > 050   7102   Shipping marks                                C  an..35
-- > 060   7102   Shipping marks                                C  an..35
-- > 070   7102   Shipping marks                                C  an..35
-- > 080   7102   Shipping marks                                C  an..35
-- > 090   7102   Shipping marks                                C  an..35
-- > 100   7102   Shipping marks                                C  an..35
--
-- Dependencies: 'simple7102'.
compositeC210 :: Parser Value
compositeC210 =
  composite "C210"
    [ "010" .@ mandatory simple7102
    , "020" .@ optional  simple7102
    , "030" .@ optional  simple7102
    , "040" .@ optional  simple7102
    , "050" .@ optional  simple7102
    , "060" .@ optional  simple7102
    , "070" .@ optional  simple7102
    , "080" .@ optional  simple7102
    , "090" .@ optional  simple7102
    , "100" .@ optional  simple7102
    ]
