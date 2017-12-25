{-# LANGUAGE NoImplicitPrelude #-}
module Test.HLint.Run (run) where

import Control.Monad (unless)
import Data.List (null)
import Data.String (String)
import System.Exit (exitFailure)
import System.IO (IO, putStrLn)

import Language.Haskell.HLint (hlint)


run :: [String] -> IO ()
run args = do
    putStrLn "" -- less confusing output, test-framework does this too
    hints <- hlint args
    unless (null hints) exitFailure
