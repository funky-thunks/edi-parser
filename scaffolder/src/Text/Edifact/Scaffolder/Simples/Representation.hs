{-# LANGUAGE OverloadedStrings #-}

module Text.Edifact.Scaffolder.Simples.Representation
  ( -- *
    extractRepresentation
  , representationParser
  ) where

import           Text.Edifact.Scaffolder.Commons
import           Text.Edifact.Scaffolder.Simples.Types

import           Text.Parsec                           as P (char, choice,
                                                             digit, many1,
                                                             option, optional,
                                                             space, string, try)
import           Text.Parsec.String                    (Parser)

extractRepresentation :: FilePath -> Scaffolding (Maybe Representation)
extractRepresentation file =
  let parser = skipBeginning representationParser
  in liftIO (readFile file) >>= maybeParse file parser

contentParser :: Parser Content
contentParser =
  choice [ AlphaNumeric <$ try (P.string "an")
         , Alpha        <$ P.string "a"
         , Numeric      <$ P.string "n"
         ]

cardinalityParser :: Parser Cardinality
cardinalityParser =
  option AnyNumber $
    choice [ Exactly <$> (optional space *> numberParser)
           , UpTo    <$> (dot *> dot *> numberParser)
           ]

numberParser :: Parser Int
numberParser = read <$> many1 digit

dot :: Parser Char
dot = P.char '.'

representationParser :: Parser Representation
representationParser =
  let parser = Representation <$> contentParser
                              <*> cardinalityParser
  in P.string "Repr:" *> space *> parser
