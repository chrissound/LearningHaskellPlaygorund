-- tags: type classes, record types

module ExploringRecords where

data Gender = Male | Female

data Person a = MkPerson
    { name :: String
    , age :: Int
    }
    deriving (Show)

data Yolo a b = HmmYolo Int Int a deriving (Show)

data PersonMale = Wob Gender

class DoubleAge a where
    doubleAge :: a -> Int

instance DoubleAge (Person a) where
    doubleAge (MkPerson name age) = age * 2

main = do
        let chris = MkPerson "Chris" 16 :: Person String
        print chris
        print . doubleAge $ chris
        print "Hello"
