module ExploringMonadMaybeness where

main :: IO ()
main = do
  print "test"
  z <- abc :: IO (Maybe Int)
  print "test"
  print $ (+5) <$> z

abc :: IO (Maybe Int)
abc = return $ Just 5
