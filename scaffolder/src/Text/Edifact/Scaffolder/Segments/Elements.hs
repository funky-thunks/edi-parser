module Text.Edifact.Scaffolder.Segments.Elements
  ( listSegments
  ) where

import           Text.Edifact.Scaffolder.Commons

import           Data.Char                       (isLower, toUpper)
import           Text.Parsec                     (eof, lower, satisfy, string,
                                                  (<?>))
import           Text.Parsec.String              (Parser)

listSegments :: Scaffolding [ElementWithDefinition SegmentCode]
listSegments = listElements "segments" segmentCodeParser

segmentCodeParser :: Parser SegmentCode
segmentCodeParser = do
  c1 <- lowerExceptU
  c2 <- lower
  c3 <- lower
  let code = SegmentCode (toUpper <$> [c1,c2,c3])
  code <$  string ".txt"
       <*  eof
       <?> "SegmentCode"

lowerExceptU :: Parser Char
lowerExceptU = satisfy (\ c -> isLower c && c /= 'u')
