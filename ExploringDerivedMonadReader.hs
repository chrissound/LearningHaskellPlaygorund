{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE DeriveGeneric #-}

import Control.Monad.Trans.Reader hiding (ask)
import Control.Monad.Trans
import Control.Monad.Reader

newtype ExampleM a = ExampleM { runExampleM :: ReaderT (Int) IO a} deriving (Functor, Applicative, Monad, MonadIO, MonadReader(Int))

main :: IO ()
main = do
  x <- (runReaderT $ readerExample) 100
  print x
  (runReaderT $ runExampleM $ readerExample2) 100 >>= print
  print "done"

readerExample :: ReaderT Integer IO String
readerExample = do
  x <- ask
  return $ "The value is: " ++ show x

readerExample2 :: ExampleM String
readerExample2 = do
  x <- ask
  return $ "The second value is: " ++ show x

liftingExample :: IO ()
liftingExample = do
  print "Test"
