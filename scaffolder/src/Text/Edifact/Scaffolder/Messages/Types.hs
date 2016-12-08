{-# LANGUAGE DerivingStrategies         #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module Text.Edifact.Scaffolder.Messages.Types where

import           Text.Edifact.Scaffolder.Commons

import           Data.Function                   (on)
import           Data.Ord                        (comparing)

newtype Dependency = Dependency { getElement :: Element } deriving newtype (Show, Ord, Eq)

data Repetition = Repetition Presence Cardinality deriving Show

data Positional = Positional { positionalPosition   :: Position
                             , positionalRepetition :: Repetition
                             } deriving (Show)

instance Eq Positional where
  (==) = (==) `on` positionalPosition

instance Ord Positional where
  compare = comparing positionalPosition

data Element = Segment    SegmentCode Positional
             | GroupStart GroupCode   Positional
             | GroupEnd   GroupCode
               deriving (Show, Ord, Eq)

getSegment :: Element -> Maybe SegmentCode
getSegment (Segment code _) = Just code
getSegment _                = Nothing

newtype Cardinality = Cardinality { getCardinality :: Int }
  deriving stock (Show)
  deriving newtype (Eq, Num)
