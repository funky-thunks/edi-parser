{-# LANGUAGE OverloadedStrings #-}

module Text.Edifact.Fetcher.Commons where

import           Text.Edifact.Fetcher.Configuration
import           Text.Edifact.Scaffolder.Commons

import           Control.Monad                      ((>=>))
import           Control.Monad.Error.Class          (MonadError, catchError)
import           Control.Monad.IO.Class             (MonadIO)
import           Control.Monad.Reader               (ReaderT, runReaderT)
import           Control.Monad.Trans.Class          (lift)
import           Data.ByteString                    (ByteString)
import           Data.Char                          (toLower)
import           Data.Text                          as T (unpack, pack)
import           Data.Text.IO                       as TIO (readFile, writeFile)
import           Formatting
import           System.Directory                   (doesFileExist)
import           Text.Pandoc                        as Pandoc hiding (Format,
                                                               getOutputFile)
import           Text.Parsec                        (Parsec, runParser)

type Fetcher = ReaderT FetchingEnv PandocIO

runFetcher :: Fetcher () -> FetchingEnv -> IO ()
runFetcher f = Pandoc.runIOorExplode . runReaderT f

getOutputFile :: Format String (a -> String) -> FilePath -> a -> Fetcher FilePath
getOutputFile f d c = do
  home <- getSpecificationHome
  pure (formatToString (string % "/" % string % "/" % f) home d c)

getUrl :: Format String (a -> String) -> a -> Fetcher String
getUrl f c = do
  rev <- getTargetRevision
  pure (formatToString ("https://service.unece.org/trade/untdid/" % fRevisionLower % f) rev c)

getSpecificationHome :: Fetcher FilePath
getSpecificationHome = do
  home <- getHome
  rev <- getTargetRevision
  pure (home </> formatToString fRevision rev)

htmlToFile :: String -> (ByteString -> Text) -> FilePath -> Fetcher ()
htmlToFile url decoder outputFile = () <$ tryCacheOrHtml decoder url outputFile

htmlToFileWithParser :: (Monoid a, Monoid u) => String -> (ByteString -> Text) -> FilePath -> Parsec String u a -> Fetcher a
htmlToFileWithParser url decoder outputFile parser = do
  specification <- tryCacheOrHtml decoder url outputFile
  either (error . show) pure
    (runParser parser mempty "" (T.unpack specification))

tryCacheOrHtml :: (ByteString -> Text) -> String -> FilePath -> Fetcher Text
tryCacheOrHtml decoder url path = do
  fileExists' <- liftIO $ doesFileExist path
  content <- if fileExists'
             then liftIO $ TIO.readFile path
             else readHtmlFromURL decoder url >>= writePlain def
  content <$ liftIO (TIO.writeFile path content)

readHtmlFromURL :: (ByteString -> Text) -> String -> Fetcher Pandoc
readHtmlFromURL decoder = lift . (openURL >=> readHtml def . decoder . fst) . pack

lower :: Format r (String -> r)
lower = mapf (fmap toLower) string

fRevision :: Format r (Revision -> r)
fRevision = mapf getRevision string

fRevisionLower :: Format r (Revision -> r)
fRevisionLower = mapf getRevision lower

fMessageCodeLower :: Format r (MessageCode -> r)
fMessageCodeLower = mapf getMessageCode lower

fSegmentCodeLower :: Format r (SegmentCode -> r)
fSegmentCodeLower = mapf getSegmentCode lower

fCompositeCodeLower :: Format r (CompositeCode -> r)
fCompositeCodeLower = mapf getCompositeCode lower

fSimpleCodeLower :: Format r (SimpleCode -> r)
fSimpleCodeLower = mapf getSimpleCode lower

retry :: (MonadIO m, MonadError b m) => Int -> m a -> m a
retry n f | n > 1     = f `catchError` const (say "Retrying" >> retry (n-1) f)
          | otherwise = f
