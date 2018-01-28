module ExploringRecords2 where

import Control.Lens hiding (element)

data Person = Person
  {
    name :: String
  , counter :: Int
  }

incrementPersonCounter :: Person -> Person
incrementPersonCounter p@(Person _ c) = p { counter = c + 1 }

applyRecord r f f' = r
  { f = f' (f r) }

main = print "Hello"
