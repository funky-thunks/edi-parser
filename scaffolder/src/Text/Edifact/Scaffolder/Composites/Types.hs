{-# LANGUAGE DerivingStrategies         #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module Text.Edifact.Scaffolder.Composites.Types where

import           Text.Edifact.Scaffolder.Commons

import           Formatting

data Dependency = Dependency { dependencyPosition :: Position
                             , dependencyElement  :: Element
                             , dependencyPresence :: Presence
                             } deriving Show

newtype Element = Simple { getElementSimpleCode :: SimpleCode } deriving newtype (Show, Eq, Ord, IsString)

fElement :: Format r (Element -> r)
fElement = mapf getElementSimpleCode fSimpleParserFunction
