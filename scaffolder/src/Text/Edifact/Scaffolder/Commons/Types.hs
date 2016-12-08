{-# LANGUAGE DerivingStrategies         #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module Text.Edifact.Scaffolder.Commons.Types
  ( -- * Codes of elements
    MessageCode(..)
  , GroupCode(..)
  , SegmentCode(..)
  , SegmentName(..)
  , CompositeCode (..)
  , CompositeName (..)
  , SimpleCode(..)
  , SimpleName(..)
    -- * Ordering of elements
  , Position(..)
    -- * Attributes
  , Presence(..)
    -- *
  , ModuleName(..)
  , (<.>)
    -- *
  , LanguageExtension(..)
    -- *
  , Scaffolding
  , Revision(..)
  , ScaffoldingEnv(..)
  , disableDebugging
  ) where

import           Control.Monad.Reader (ReaderT)
import           Data.String          (IsString)

newtype MessageCode   = MessageCode   { getMessageCode   :: String } deriving newtype (Show, Eq, Ord, IsString)
newtype GroupCode     = GroupCode     { getGroupCode     :: String } deriving newtype (Show, Eq, Ord, IsString)
newtype SegmentCode   = SegmentCode   { getSegmentCode   :: String } deriving newtype (Show, Eq, Ord, IsString)
newtype SegmentName   = SegmentName   { getSegmentName   :: String } deriving newtype (Show, Eq, Ord, IsString)
newtype CompositeCode = CompositeCode { getCompositeCode :: String } deriving newtype (Show, Eq, Ord, IsString)
newtype CompositeName = CompositeName { getCompositeName :: String } deriving newtype (Show, Eq, Ord, IsString)
newtype SimpleCode    = SimpleCode    { getSimpleCode    :: String } deriving newtype (Show, Eq, Ord, IsString)
newtype SimpleName    = SimpleName    { getSimpleName    :: String } deriving newtype (Show, Eq, Ord, IsString)

newtype Position = Position { getPosition :: String } deriving newtype (Show, Eq, Ord, IsString)

data Presence = Mandatory
              | Optional
                deriving (Show, Eq, Ord)

newtype ModuleName = ModuleName { getModuleName :: String } deriving newtype (Show, Eq, IsString)

instance Semigroup ModuleName where
  (<>) = (<.>)

(<.>) :: ModuleName -> ModuleName -> ModuleName
(ModuleName parent) <.> (ModuleName child) = ModuleName (parent <> "." <> child)

newtype LanguageExtension = LanguageExtension { getLanguageExtension :: String } deriving newtype IsString

type Scaffolding = ReaderT ScaffoldingEnv IO

newtype Revision = Revision { getRevision :: String } deriving newtype (Show, Eq, IsString)

data ScaffoldingEnv =
  ScaffoldingEnv
    { revision           :: Revision
    , hostModule         :: ModuleName
    , specificationsHome :: FilePath
    , targetDirectory    :: FilePath
    , debugParsing       :: Bool
    }

disableDebugging :: ScaffoldingEnv -> ScaffoldingEnv
disableDebugging env = env { debugParsing = False }
