{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Segments.STS
  ( -- * Definition
    segmentSTS
    -- * Dependencies
  , compositeC555
  , compositeC556
  , compositeC601
  ) where

import           Text.Edifact.D01B.Composites (compositeC555, compositeC556,
                                               compositeC601)

import           Text.Edifact.Parsing
import           Text.Edifact.Types           (Value)

-- | Derived from this specification:
--
-- >        STS  STATUS
-- >
-- >        Function: To specify the status of an object or service,
-- >                  including its category and the reason(s) for the
-- >                  status.
-- >
-- > 010    C601 STATUS CATEGORY                            C    1
-- >        9015  Status category code                      M      an..3
-- >        1131  Code list identification code             C      an..17
-- >        3055  Code list responsible agency code         C      an..3
-- >
-- > 020    C555 STATUS                                     C    1
-- >        4405  Status description code                   M      an..3
-- >        1131  Code list identification code             C      an..17
-- >        3055  Code list responsible agency code         C      an..3
-- >        4404  Status description                        C      an..35
-- >
-- > 030    C556 STATUS REASON                              C    1
-- >        9013  Status reason description code            M      an..3
-- >        1131  Code list identification code             C      an..17
-- >        3055  Code list responsible agency code         C      an..3
-- >        9012  Status reason description                 C      an..256
-- >
-- > 040    C556 STATUS REASON                              C    1
-- >        9013  Status reason description code            M      an..3
-- >        1131  Code list identification code             C      an..17
-- >        3055  Code list responsible agency code         C      an..3
-- >        9012  Status reason description                 C      an..256
-- >
-- > 050    C556 STATUS REASON                              C    1
-- >        9013  Status reason description code            M      an..3
-- >        1131  Code list identification code             C      an..17
-- >        3055  Code list responsible agency code         C      an..3
-- >        9012  Status reason description                 C      an..256
-- >
-- > 060    C556 STATUS REASON                              C    1
-- >        9013  Status reason description code            M      an..3
-- >        1131  Code list identification code             C      an..17
-- >        3055  Code list responsible agency code         C      an..3
-- >        9012  Status reason description                 C      an..256
-- >
-- > 070    C556 STATUS REASON                              C    1
-- >        9013  Status reason description code            M      an..3
-- >        1131  Code list identification code             C      an..17
-- >        3055  Code list responsible agency code         C      an..3
-- >        9012  Status reason description                 C      an..256
--
-- Dependencies: 'compositeC555', 'compositeC556', 'compositeC601'.
segmentSTS :: Parser Value
segmentSTS =
  segment "STS"
    [ "010" .@ optional  compositeC601
    , "020" .@ optional  compositeC555
    , "030" .@ optional  compositeC556
    , "040" .@ optional  compositeC556
    , "050" .@ optional  compositeC556
    , "060" .@ optional  compositeC556
    , "070" .@ optional  compositeC556
    ]
