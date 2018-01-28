-- tags: type classes, functor, record types
data EitherIO e a = EitherIO {
    runEitherIO :: IO (Either e a)
}

instance Functor (EitherIO e) where
  fmap f ex = wrapped
    where
      unwrapped = runEitherIO ex
      fmapped   = fmap (fmap f) unwrapped
      wrapped   = EitherIO fmapped

testValue :: IO (Either String String)
testValue = do 
    putStrLn "Abc abc abc"
    return (Right "Test")

main = do
    let eitherIoAction = EitherIO {runEitherIO=testValue}
    let eitherIoActionfmapped = fmap (\_ -> "abcxyz") eitherIoAction

    runEitherIO eitherIoAction >>= print
    runEitherIO eitherIoActionfmapped >>= print
