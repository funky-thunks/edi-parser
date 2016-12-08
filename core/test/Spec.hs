import qualified ParsingTest

import           Test.Framework

main :: IO ()
main = defaultMain [suite]

suite :: Test
suite = testGroup "Edifact"
  [ ParsingTest.suite
  ]
