module Text.Edifact.Scaffolder.Messages.Elements
  ( listMessages
  ) where

import           Text.Edifact.Scaffolder.Commons

import           Data.Char                       (toUpper)
import           Text.Parsec                     (count, eof, lower, string,
                                                  (<?>))
import           Text.Parsec.String              (Parser)

-- | List elements
listMessages :: Scaffolding [ElementWithDefinition MessageCode]
listMessages = listElements "messages" messageFilenameParser

messageFilenameParser :: Parser MessageCode
messageFilenameParser =
  let mkCode = MessageCode . fmap toUpper
  in mkCode <$> count 6 lower
            <*  string "_s.txt"
            <*  eof
            <?> "MessageCode"
