import Control.Monad.Trans.Reader hiding (ask)
import Control.Monad.Trans

-- A key part of the Reader monad is the `ask` function
-- which is as such :
ask :: Monad m => ReaderT r m r
ask = reader id

main :: IO ()
main = do
  let f = (runReaderT $ readerExample) :: Integer -> IO String
  x <- f 100
  print x
  --
  let fIO = (runReaderT $ readerExampleIO) :: Integer -> IO String
  y <- fIO 200
  print y
  z <- ((runReaderT $ readerMaybeIO) $ 200)
  print . show $ z

readerExample :: ReaderT Integer IO String
readerExample = do
  x <- ask
  return $ "The value is: " ++ show x

readerMaybe :: ReaderT Integer IO (Maybe String)
readerMaybe = return $ Just "Yes"

readerMaybeIO :: ReaderT Integer IO (Maybe String)
readerMaybeIO = do
  lift $ print "Hello from within"
  z <- readerMaybe
  case z of
    Just z' -> lift $ print z'
    Nothing -> return ()
  return $ Just ""

liftAnnotated :: IO a -> ReaderT Integer IO a
liftAnnotated = lift

readerExampleIO :: ReaderT Integer IO String
readerExampleIO = do
  x <- reader id
  lift $ print "Hello from within"
  liftAnnotated $ print "Hello from within..."
  return $ "The value is: " ++ show x
