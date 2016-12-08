module Text.Edifact.BundleReader
  ( readBundle
  , BundleReaderEnv(..)
  ) where

import           Text.Edifact.BundleReader.Commons       (BundleReader,
                                                          getSpecificationHome,
                                                          runBundleReader)
import           Text.Edifact.BundleReader.Composites    (compositesDirectory,
                                                          readComposites)
import           Text.Edifact.BundleReader.Configuration
import           Text.Edifact.BundleReader.Extractor     (FileContents (..),
                                                          readZip)
import           Text.Edifact.BundleReader.Messages      (messagesDirectory,
                                                          readMessages)
import           Text.Edifact.BundleReader.Segments      (readSegments,
                                                          segmentsDirectory)
import           Text.Edifact.BundleReader.CodedSimples  (readCodedSimples)
import           Text.Edifact.BundleReader.Simples       (readSimples,
                                                          simplesDirectory)

import           Control.Monad.IO.Class                  (liftIO)
import           Control.Monad.Reader                    (asks)
import           Data.Foldable                           (traverse_)
import           System.Directory                        (createDirectoryIfMissing)
import           System.FilePath                         ((</>))

readBundle :: BundleReaderEnv -> IO ()
readBundle = runBundleReader (setupDirectories >> readAll)

readAll :: BundleReader ()
readAll = do
  revision <- asks parserRevision
  bundles <- mapM (liftIO . readZip revision) =<< asks bundle
  messages' <- readMessages (concatMap messages bundles)
  printContent messages' "Messages with segments codes:"
  segments' <- readSegments (concatMap segments bundles) $ concatMap snd messages'
  printContent segments' "Segments with composites/simples:"
  simples' <- readSimples (concatMap simples bundles) =<< readComposites (concatMap composites bundles) segments'
  readCodedSimples (concatMap codedSimples bundles) simples'
  printContent simples' "Simples:"
  pure ()

printContent :: Show a => a -> String -> BundleReader ()
printContent content header = liftIO $ putStrLn header >> print content >> putStrLn ""

setupDirectories :: BundleReader ()
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
