module Text.Edifact.Fetcher
  ( fetch
  , FetchingEnv(..)
  , readSelectMessages
  ) where

import           Text.Edifact.Fetcher.Commons       (Fetcher,
                                                     getSpecificationHome,
                                                     runFetcher)
import           Text.Edifact.Fetcher.Configuration

import           Text.Edifact.Fetcher.Composites    (compositesDirectory,
                                                     fetchComposites)
import           Text.Edifact.Fetcher.Messages      (fetchMessages,
                                                     messagesDirectory)
import           Text.Edifact.Fetcher.Segments      (fetchSegments,
                                                     segmentsDirectory)
import           Text.Edifact.Fetcher.Simples       (fetchSimples,
                                                     simplesDirectory)

import           Control.Monad.IO.Class             (liftIO)
import           Data.Foldable                      (traverse_)
import           System.Directory                   (createDirectoryIfMissing)
import           System.FilePath                    ((</>))

fetch :: FetchingEnv -> IO ()
fetch = runFetcher (setupDirectories >> fetchAll)

fetchAll :: Fetcher ()
fetchAll = fetchMessages >>= fetchSegments >>= fetchComposites >>= fetchSimples

setupDirectories :: Fetcher ()
setupDirectories = do
  home <- getSpecificationHome
  let mkdir d = liftIO (createDirectoryIfMissing True (home </> d))
  traverse_ mkdir directories

directories :: [FilePath]
directories =
  [ compositesDirectory
  , messagesDirectory
  , segmentsDirectory
  , simplesDirectory
  ]
