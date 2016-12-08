{-|
Module      : Text.Edifact.Common
Description : Common syntax

This module should handle the main revision of the Edifact specification, which
covers UN* segments.

Currently it barely covers the revision 3 and this has not been scaffolded.

One future evolution will be to scaffold the various revisions from a more
general specification.
 -}
module Text.Edifact.Common
  (
    -- * Routine
    parseFull

    -- * Reexports
  , ParseError
  , Parser
  , Text
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Parsing.Commons

import           Text.Edifact.Common.Segments

import           Data.Text                    (Text)

parseFull :: Parser value -> Text -> Either ParseError value
parseFull = parse . fullSyntaxParser

fullSyntaxParser :: Parser a -> Parser a
fullSyntaxParser messageParser =
  segmentUNA >>
  tries [ segmentUNB *> messageParser <* segmentUNZ
        , messageParser
        ]
