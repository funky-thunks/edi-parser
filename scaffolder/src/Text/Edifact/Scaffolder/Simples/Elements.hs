module Text.Edifact.Scaffolder.Simples.Elements
  ( listSimples
  ) where

import           Text.Edifact.Scaffolder.Commons

import           Text.Parsec                     (digit, eof, oneOf, string,
                                                  (<?>))
import           Text.Parsec.String              (Parser)

listSimples :: Scaffolding [ElementWithDefinition SimpleCode]
listSimples = listElements "simples" simpleCodeParser

simpleCodeParser :: Parser SimpleCode
simpleCodeParser =
  let codeParser =
        sequence [ oneOf ['1'..'9']
                 , digit
                 , digit
                 , digit
                 ]
  in
  SimpleCode <$> codeParser
             <*  string ".txt"
             <*  eof
             <?> "SimpleCode"
