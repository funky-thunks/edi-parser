{-# LANGUAGE OverloadedStrings #-}

module Main where

import           Text.Edifact.BundleReader (BundleReaderEnv (..), readBundle)
import           Text.Edifact.Fetcher      (FetchingEnv (..), fetch,
                                            readSelectMessages)
import           Text.Edifact.Scaffolder   (ScaffoldingEnv (..), scaffold)

import           Data.String               (fromString)
import           Options.Applicative

main :: IO ()
main = execParser argumentsParser >>= run

data Command = ScaffoldCommand ScaffoldingEnv
             | FetchCommand FetchingEnv
             | BundleReaderCommand BundleReaderEnv

commandParser :: Parser Command
commandParser =
  let mkCommand cmd = command (commandName cmd) (info (commandArgumentsParser cmd) (describe cmd))
  in subparser (foldMap mkCommand [ Scaffold, Fetch, ReadBundle ])

data CommandType = Scaffold | Fetch | ReadBundle

run :: Command -> IO ()
run (ScaffoldCommand     env) = scaffold env
run (FetchCommand        env) = fetch env
run (BundleReaderCommand env) = readBundle env

commandName :: CommandType -> String
commandName Scaffold   = "scaffold"
commandName Fetch      = "fetch"
commandName ReadBundle = "read-bundle"

commandArgumentsParser :: CommandType -> Parser Command
commandArgumentsParser Scaffold =
  let revisionArg      = strOption (long "revision"      <> metavar "REVISION")
      moduleNameArg    = strOption (long "module-name"   <> metavar "MODULE_NAME"   <> value "Text.Edifact")
      specificationArg = strOption (long "specification" <> metavar "SPECIFICATION" <> value "./specification")
      srcArg           = strOption (long "src"           <> metavar "SOURCES"       <> value "./src")
      debugParsingArg  = flag False True (long "debug-parsing")
      arguments = ScaffoldingEnv <$> revisionArg
                                 <*> (fromString <$> moduleNameArg)
                                 <*> specificationArg
                                 <*> srcArg
                                 <*> debugParsingArg
  in ScaffoldCommand <$> arguments
commandArgumentsParser Fetch =
  let revisionArg         = strOption (long "revision"      <> metavar "REVISION")
      specificationArg    = strOption (long "specification" <> metavar "SPECIFICATION" <> value "./specification")
      selectedMessagesArg = readSelectMessages <$>
                              optional (strOption (long "messages" <> metavar "MESSAGES"))
      arguments = FetchingEnv <$> revisionArg
                              <*> specificationArg
                              <*> selectedMessagesArg
  in FetchCommand <$> arguments
commandArgumentsParser ReadBundle =
  let revisionArg         = strOption (long "revision"      <> metavar "REVISION")
      specificationArg    = strOption (long "specification" <> metavar "SPECIFICATION" <> value "./specification")
      bundle           = many (strOption (long "bundle" <> metavar "BUNDLE"))
      messagesFiles    = many (strOption (long "message-file" <> metavar "MESSAGE_FILE"))
      selectedMessages = many (strOption (long "message" <> metavar "MESSAGE"))
      segmentsFiles    = many (strOption (long "segment-file" <> metavar "SEGMENT_FILE"))
      compositeFiles   = many (strOption (long "composite-file" <> metavar "COMPOSITE_FILE"))
      simpleFiles      = many (strOption (long "simple-file" <> metavar "SIMPLE_FILE"))
      codedSimpleFiles = many (strOption (long "coded-simple-file" <> metavar "CODED_SIMPLE_FILE"))
      arguments = BundleReaderEnv <$> revisionArg
                           <*> specificationArg
                           <*> bundle
                           <*> selectedMessages
                           <*> messagesFiles
                           <*> segmentsFiles
                           <*> compositeFiles
                           <*> simpleFiles
                           <*> codedSimpleFiles
  in BundleReaderCommand <$> arguments

describe :: CommandType -> InfoMod a
describe Scaffold   = progDesc "Scaffold parsers from specification previously fetched"
describe Fetch      = progDesc "Fetch specification from UN website (Deprecated! Use read-bundle instead)"
describe ReadBundle = progDesc "Read specification bundle downloaded from UN website"

argumentsParser :: ParserInfo Command
argumentsParser = info (commandParser <**> helper) cliDesc

cliDesc :: InfoMod a
cliDesc = fullDesc
       <> header "Let you scaffold parsers from an Edifact specification"
