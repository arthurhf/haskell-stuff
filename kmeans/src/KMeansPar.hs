module KMeansPar where

import Data.List
import Data.Function
import Control.Parallel.Strategies
import Data.Array
import Control.DeepSeq
import Debug.Trace

type Ponto = [Double]
type Cluster = [Double]

type ChunksOf a = [a]

parseFile :: String -> [[Double]]
parseFile = map (map read . words) . lines

-- divide cada elemento de xs por x
(./) :: (Floating a, Functor f) => f a -> a -> f a
xs ./ x = (/x) <$> xs

-- eleva cada elemento de xs por x
(.^) :: (Floating a, Functor f) => f a -> Int -> f a
xs .^ x = (^x) <$> xs

-- soma dois vetores elemento-a-elemento
(.+.) :: (Num a) => [a] -> [a] -> [a]
(.+.) = zipWith (+)

-- subtrai dois vetores elemento-a-elemento
(.-.) :: (Num a) => [a] -> [a] -> [a]
(.-.) = zipWith (-)

length' :: Num b => [a] -> b
length' xs = fromIntegral $ length xs

assign :: [Cluster] -> [Ponto] -> Array Int [Ponto]
assign cs ps = accumArray (flip (:)) [zeroCluster] (0, k-1)
                     [(argmin (distancias p), p) | p <- ps]
  where
    distancias p = [euclid p c | c <- cs]
    euclid p  c  = sum $ (p .-. c) .^ 2
    zeroCluster  = replicate (length $ head ps) 0
    argmin xs    = fst $ minimumBy (compare `on` snd) $ zip [0..] xs
    k            = length cs

somaClusters :: Array Int [Ponto] -> [(Cluster, Double)]
somaClusters a = [(foldr (.+.) (zeroCluster ps) ps, fromIntegral $ length ps) | (_, ps) <- assocs a]
  where
    zeroCluster ps = replicate (length $ head ps) 0

step :: [Cluster] -> [Ponto] -> [(Cluster, Double)]
step cs ps =
  force cs' -- força avaliação para não deixar o trabalho pra thread principal
  where
    cs' = somaClusters $ assign cs ps

kmeans :: Int -> ChunksOf [Ponto] -> [Cluster] -> [Cluster]
kmeans it pss cs
  | it <= 0 = cs
  | otherwise = kmeans (it-1) pss cs'
  where
    cs'           = map (\(c, n) -> c ./ n) $ sumTuples stepped
    stepped       = map (step cs) pss `using` parList rseq
    sumTuples []  = [] 
    sumTuples sts = (foldr (\(c, n) (c', n') -> (c.+.c', n+n')) zeroCluster [head st | st <- sts]) : (sumTuples [tail st | st <- sts, not (null $ tail st)])
    zeroCluster = (replicate (length $ head $ head pss) 0, 0)
