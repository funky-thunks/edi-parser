import qualified Edifact

import           Test.Framework

main :: IO ()
main = defaultMain [suite]

suite :: Test
suite = testGroup "specification"
  [ Edifact.suite
  ]
