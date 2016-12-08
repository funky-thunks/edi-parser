module Text.Edifact.Common.Segments.UNA
 ( segmentUNA
 ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Parsing.Commons (updateSyntax)
import           Text.Edifact.Types           (Syntax (..), defaultSyntax)

import           Control.Monad                (void)
import           Text.Parsec                  (anyChar, char, endOfLine,
                                               optionMaybe, string, try)
import qualified Text.Parsec                  as P (optional)

segmentUNA :: Parser ()
segmentUNA =
  let segmentParser = string "UNA" *> parseSyntax <* P.optional endOfLine
      nothing = pure ()
  in  optionMaybe (try segmentParser) >>= maybe nothing updateSyntax

parseSyntax :: Parser Syntax
parseSyntax = do
  compositeSeparator' <- anyChar
  elementSeparator'   <- anyChar
  decimalSign'        <- anyChar
  escape'             <- anyChar
  void $ char ' ' -- reserved, not used
  segmentSeparator'   <- anyChar
  pure defaultSyntax
    { compositeSeparator = compositeSeparator'
    , elementSeparator   = elementSeparator'
    , decimalSign        = decimalSign'
    , escape             = escape'
    , segmentSeparator   = segmentSeparator'
    }
