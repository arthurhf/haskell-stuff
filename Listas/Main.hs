module Main where

data Nat = Zero | Succ Nat deriving (Show)

data Tree a = Leaf a | Node (Tree a) a (Tree a) deriving (Show)

data Arvore a = Folha a | Nó (Arvore a) (Arvore a) deriving (Show)

main :: IO ()
main = do
  putStrLn "hello world"

add :: Nat -> Nat -> Nat
add Zero n = n
add (Succ m) n = Succ (add m n)

mult :: Nat -> Nat -> Nat
mult Zero _ = Zero
mult (Succ Zero) n = n
mult (Succ m) n = mult m (add n n)

occurs :: Ord a => a -> Tree a -> Bool
occurs n (Leaf a) = (compare a n) == EQ 
occurs n (Node (a) b (c)) = 
  if compare n b == EQ then True else occurs n a || occurs n c

--retorna uma lista ordenada com os elementos da árvore percorrida em ordem.
flatten :: Tree a -> [a]
flatten (Leaf a) = [a]
flatten (Node a b c) = flatten a ++ [b] ++ flatten c

countLeaf :: Arvore a -> Int
countLeaf (Folha a) = 1
countLeaf (Nó a b) = countLeaf a + countLeaf b

balanced :: Arvore a -> Bool
balanced (Folha a) = False
balanced (Nó a b) = (countLeaf a - countLeaf b) < 2

type Coord = (Int, Int)
type Trans = Coord -> Coord
data Dir = Norte | Sul | Leste | Oeste

norte :: Trans
norte (x,y) = (x,y+1)

para :: Dir -> Trans
para Norte (x,y) = (x,y+1)
para Sul (x,y) = (x,y-1)
para Leste (x,y) = (x+1,y)
para Oeste (x,y) = (x-1,y)