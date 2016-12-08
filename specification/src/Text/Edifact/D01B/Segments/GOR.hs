{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Segments.GOR
  ( -- * Definition
    segmentGOR
    -- * Dependencies
  , compositeC232
  , simple8323
  ) where

import           Text.Edifact.D01B.Composites (compositeC232)
import           Text.Edifact.D01B.Simples    (simple8323)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >        GOR  GOVERNMENTAL REQUIREMENTS
-- >
-- >        Function: To indicate the requirement for a specific
-- >                  governmental action and/or procedure or which
-- >                  specific procedure is valid for a specific part
-- >                  of the transport.
-- >
-- > 010    8323 TRANSPORT MOVEMENT CODE                    C    1 an..3
-- >
-- > 020    C232 GOVERNMENT ACTION                          C    1
-- >        9415  Government agency identification code     C      an..3
-- >        9411  Government involvement code               C      an..3
-- >        9417  Government action code                    C      an..3
-- >        9353  Government procedure code                 C      an..3
-- >
-- > 030    C232 GOVERNMENT ACTION                          C    1
-- >        9415  Government agency identification code     C      an..3
-- >        9411  Government involvement code               C      an..3
-- >        9417  Government action code                    C      an..3
-- >        9353  Government procedure code                 C      an..3
-- >
-- > 040    C232 GOVERNMENT ACTION                          C    1
-- >        9415  Government agency identification code     C      an..3
-- >        9411  Government involvement code               C      an..3
-- >        9417  Government action code                    C      an..3
-- >        9353  Government procedure code                 C      an..3
-- >
-- > 050    C232 GOVERNMENT ACTION                          C    1
-- >        9415  Government agency identification code     C      an..3
-- >        9411  Government involvement code               C      an..3
-- >        9417  Government action code                    C      an..3
-- >        9353  Government procedure code                 C      an..3
--
-- Dependencies: 'compositeC232', 'simple8323'.
segmentGOR :: Parser Value
segmentGOR =
  segment "GOR"
    [ "010" .@ optional  simple8323
    , "020" .@ optional  compositeC232
    , "030" .@ optional  compositeC232
    , "040" .@ optional  compositeC232
    , "050" .@ optional  compositeC232
    ]
