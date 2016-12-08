{-# LANGUAGE FlexibleContexts  #-}
{-# LANGUAGE OverloadedStrings #-}

module Text.Edifact.Fetcher.Configuration
  ( -- * Fetching environment
    FetchingEnv(..)
    -- * Parsing helpers
  , readSelectMessages
    -- * Shortcuts for reading the environment
  , getTargetRevision
  , getHome
  , getSelectedMessages
  ) where

import           Text.Edifact.Scaffolder.Commons (MessageCode, Revision,
                                                  messageCodeParser)

import           Control.Monad.Reader.Class      (MonadReader, asks)
import           Data.List.NonEmpty              (NonEmpty, nonEmpty)
import           Text.Parsec                     (char, parse, sepBy1)

data FetchingEnv = FetchingEnv { fetchingRevision  :: Revision
                               , specificationHome :: FilePath
                               , selectedMessages  :: Maybe (NonEmpty MessageCode)
                               }

getTargetRevision :: MonadReader FetchingEnv m => m Revision
getTargetRevision = asks fetchingRevision

getHome :: MonadReader FetchingEnv m => m FilePath
getHome = asks specificationHome

getSelectedMessages :: MonadReader FetchingEnv m => m (Maybe (NonEmpty MessageCode))
getSelectedMessages = asks selectedMessages

readSelectMessages :: Maybe String -> Maybe (NonEmpty MessageCode)
readSelectMessages value =
  let tryParse p s = toMaybe . parse p s
      toMaybe (Right v) = Just v
      toMaybe _         = Nothing
      messageCodesParser = messageCodeParser `sepBy1` comma
      comma = char ','
  in value >>= tryParse messageCodesParser "" >>= nonEmpty
