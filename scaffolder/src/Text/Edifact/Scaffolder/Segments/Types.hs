module Text.Edifact.Scaffolder.Segments.Types where

import           Text.Edifact.Scaffolder.Commons

data Dependency = Dependency { dependencyPosition :: Position
                             , dependencyElement  :: Element
                             } deriving Show

data Element = Composite CompositeCode Text Presence
             | Simple SimpleCode Text Presence SimpleType SimpleLength
               deriving (Show, Eq, Ord)

data SimpleType = Alphanumeric | Alphabetic | Numeric deriving (Show, Eq, Ord)

data SimpleLength = Exactly Text | UpTo Text deriving (Show, Eq, Ord)

getCode :: Element -> String
getCode (Simple (SimpleCode c) _ _ _ _)   = c
getCode (Composite (CompositeCode c) _ _) = c

getSimple :: Element -> Maybe SimpleCode
getSimple (Simple c _ _ _ _) = Just c
getSimple _                  = Nothing

getComposite :: Element -> Maybe CompositeCode
getComposite (Composite c _ _) = Just c
getComposite _                 = Nothing
