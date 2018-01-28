import Control.Monad.Trans.Either


example :: EitherT String IO Int
example = EitherT $ z where
  z = do
    print "test"
    return $ Right 5

main :: IO ()
main = do
  z <- runEitherT $ example
  case z of 
    Right v -> print v
    Left v -> print v
