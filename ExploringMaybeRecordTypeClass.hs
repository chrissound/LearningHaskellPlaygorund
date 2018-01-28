-- tags: type classes, record types, functor
module ExploringMaybeRecordTypeClass where

data Building a = House {
    upstairsBedrooms :: a
    , bedrooms :: Int
} deriving (Show)

instance Functor (Building) where
  fmap f (House i j) = House (f i) j

main = do
    let house1 = House 2 2
    print house1
    let house2 = House "None" 2
    print house2
    print . fmap (\x -> x) $ house1
