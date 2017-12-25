{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE NoImplicitPrelude #-}
module Test.HLint.Preprocessor (main) where

import Control.Monad ((>>=))
import Data.Function (($), (.))
import Data.List (null)
import Data.Monoid ((<>))
import Data.String (String, unlines)
import System.Environment (getArgs)
import System.Exit (exitFailure)
import System.IO (IO, writeFile)
import Text.Show (show)


main :: IO ()
main = getArgs >>= \case
    _src : _inp : dst : args ->
        writeFile dst . unlines $ mkModule args
    _ ->
        exitFailure

mkModule :: [String] -> [String]
mkModule args =
    [ "{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}"
    , "{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}"
    , "module Main (main) where"
    , ""
    , "import Prelude"
    , "import Test.HLint.Run (run)"
    , ""
    , "main :: IO ()"
    , "main = run " <> show (if null args then ["."] else args)
    ]
