module ExploringSTM where

import Control.Monad.STM
import Control.Concurrent.STM.TVar
import Control.Concurrent

increment :: Num a => TVar a -> IO ()
increment y = atomically $ do
    y' <- readTVar y
    writeTVar y (y' +1)

main :: IO ()
main = do
  y <- atomically $ do
    newTVar (1 :: Int)
  readTVarIO y >>= print
  _ <- forkIO (do
    increment y
    increment y
    increment y
    )
  readTVarIO y >>= print
  increment y
  readTVarIO y >>= print
  threadDelay 500000
  readTVarIO y >>= print
  readTVarIO y >>= print
  readTVarIO y >>= print
  readTVarIO y >>= print
