module Text.Edifact.Scaffolder.Commons
  ( -- *
    runScaffolding
    -- * Reexports
  , module X
  ) where

import           Text.Edifact.Scaffolder.Commons.Formatters as X
import           Text.Edifact.Scaffolder.Commons.Language   as X
import           Text.Edifact.Scaffolder.Commons.Logging    as X
import           Text.Edifact.Scaffolder.Commons.Parsing    as X
import           Text.Edifact.Scaffolder.Commons.Text       as X
import           Text.Edifact.Scaffolder.Commons.Types      as X

import           Control.Monad.IO.Class                     as X (liftIO)
import           Data.List.NonEmpty                         as X (NonEmpty, nub,
                                                                  sort)
import           Data.Maybe                                 as X (fromMaybe)
import           Data.Semigroup                             as X ((<>))
import           Data.String                                as X (IsString,
                                                                  fromString)
import           Data.Text                                  as X (Text)
import           System.Directory                           as X (listDirectory)
import           System.FilePath                            as X ((</>))

import           Control.Monad.Reader                       (runReaderT)

runScaffolding :: Scaffolding a -> ScaffoldingEnv -> IO a
runScaffolding = runReaderT
