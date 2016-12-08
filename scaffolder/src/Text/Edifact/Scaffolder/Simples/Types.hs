module Text.Edifact.Scaffolder.Simples.Types where

data Representation = Representation Content Cardinality
                      deriving Show

data Content = AlphaNumeric
             | Alpha
             | Numeric
               deriving Show

data Cardinality = UpTo Int
                 | Exactly Int
                 | AnyNumber
                   deriving Show
