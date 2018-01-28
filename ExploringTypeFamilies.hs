{-# LANGUAGE TypeFamilies, DataKinds, UndecidableInstances, GADTs,
             MultiParamTypeClasses, FunctionalDependencies,
             FlexibleInstances, FlexibleContexts #-}

class Addable a b c | a -> b c where
      add :: a -> b -> c -> (a,b,c)
      add a b c = (a,b,c)

instance Addable Int Int String

adder :: (Addable a b String) => a -> b -> (a,b,String)
adder a b = add a b "test"

type family Pair a

type instance Pair a = (a,a)

example :: Pair Int
example = (1,2)
--- 

main :: IO ()
main = do
     print "test"
     print example
     print (adder (2 :: Int) 2)
