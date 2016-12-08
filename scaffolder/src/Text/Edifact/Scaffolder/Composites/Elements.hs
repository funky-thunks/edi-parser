module Text.Edifact.Scaffolder.Composites.Elements
  ( listComposites
  ) where

import           Text.Edifact.Scaffolder.Commons

import           Data.Char                       (toUpper)
import           Text.Parsec                     (count, digit, eof, oneOf,
                                                  string)
import           Text.Parsec.String              (Parser)

listComposites :: Scaffolding [ElementWithDefinition CompositeCode]
listComposites = listElements "composites" compositeCodeParser

compositeCodeParser :: Parser CompositeCode
compositeCodeParser = do
  initial <- toUpper <$> oneOf "ce"
  rest <- count 3 digit
  _ <- string ".txt"
  CompositeCode (initial : rest) <$ eof
