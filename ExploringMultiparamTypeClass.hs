{-# LANGUAGE MultiParamTypeClasses #-}

data PokemonEnt = PokemonEnt String
  
-- show The battle Type Class
class Pokemon a where
  battle :: a -> IO ()
  battle _ = print "test"

instance Pokemon PokemonEnt

main :: IO ()
main = do
  battle $ PokemonEnt "Chris" 
  --battle Squirtle Charmander
-- show /
