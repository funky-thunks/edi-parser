module Text.Edifact.Scaffolder.Commons.Logging
  ( say
  ) where

import           Control.Monad.IO.Class (MonadIO, liftIO)
import qualified Data.Text.Lazy.Builder as TLB (toLazyText)
import qualified Data.Text.Lazy.IO      as TLIO (putStrLn)
import           Formatting             as F (Format, runFormat)

say :: MonadIO m => Format (m ()) a -> a
say m = runFormat m (liftIO . TLIO.putStrLn . TLB.toLazyText)
