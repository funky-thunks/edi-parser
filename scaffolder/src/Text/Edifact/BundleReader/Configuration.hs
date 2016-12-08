{-# LANGUAGE FlexibleContexts #-}

module Text.Edifact.BundleReader.Configuration
  ( -- * Parsing environment
    BundleReaderEnv(..)
    -- * Shortcuts for reading the environment
  , getTargetRevision
  , getHome
  ) where

import           Text.Edifact.Scaffolder.Commons (MessageCode, Revision)

import           Control.Monad.Reader.Class      (MonadReader, asks)

data BundleReaderEnv = BundleReaderEnv { parserRevision :: Revision
                           , specificationHome          :: FilePath
                           , bundle                     :: [FilePath]
                           , messageNames               :: [MessageCode]
                           , messagesFiles              :: [FilePath]
                           , segmentsFiles              :: [FilePath]
                           , compositesFiles            :: [FilePath]
                           , simplesFiles               :: [FilePath]
                           , codedSimplesFiles          :: [FilePath]
                           }

getTargetRevision :: MonadReader BundleReaderEnv m => m Revision
getTargetRevision = asks parserRevision

getHome :: MonadReader BundleReaderEnv m => m FilePath
getHome = asks specificationHome
