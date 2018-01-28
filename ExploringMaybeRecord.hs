-- tags: record types, maybe
module ExploringMaybeRecord where

data House a = House {
    bedrooms :: Int
    , upstairsBedrooms :: Maybe a
} deriving (Show)

data House2 = House2 (House String) deriving (Show)

main = do
    let house1 = House 2 (Just 2)
    print house1
    let house2 = House2 (House 2 (Just "2"))
    print house2
    let house2b = House2 (House 2 (Just 2))
    print house2b
