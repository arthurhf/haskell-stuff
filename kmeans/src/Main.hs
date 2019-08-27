{-# LANGUAGE OverloadedStrings #-}

module Main where

import System.Environment
import Formatting
import Formatting.Clock
import System.Clock
import Data.List.Split (chunksOf)
import Control.DeepSeq
import KMeansPar

main :: IO ()
main = do
  [fname, sk, sit, schunks] <- getArgs

  fileTrain <- readFile fname
  let k = read sk :: Int
      it = read sit :: Int
      nchunks = read schunks :: Int
      train = parseFile fileTrain
      chunks = force $ chunksOf nchunks train
      clusters = take k train

  start <- getTime Monotonic

  let clusters' = kmeans it chunks clusters
  print clusters'

  stop <- getTime Monotonic

  fprint (timeSpecs % "\n") start stop
  return ()
