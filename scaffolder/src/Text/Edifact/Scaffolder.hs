module Text.Edifact.Scaffolder
  ( scaffold
  , ScaffoldingEnv(..)
  ) where

import           Text.Edifact.Scaffolder.Commons

import           Text.Edifact.Scaffolder.Composites
import           Text.Edifact.Scaffolder.Messages
import           Text.Edifact.Scaffolder.Root
import           Text.Edifact.Scaffolder.Segments
import           Text.Edifact.Scaffolder.Simples

scaffold :: ScaffoldingEnv -> IO ()
scaffold = runScaffolding $ do
  messages
  segments
  composites
  simples
  rootModule
