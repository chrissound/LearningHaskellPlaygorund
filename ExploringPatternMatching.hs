f :: Either (Maybe e) Int -> Int
f (Right x) = x
f (Left (Just _)) = 1
f _ = 0

main :: IO ()
main = do
  print . f $ Right 5
  print "hello"
