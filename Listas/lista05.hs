
-- ex1

data Nat = Zero | Succ Nat deriving Show

add :: Nat -> Nat -> Nat
add Zero n      = n
add (Succ m) n  = Succ (add m n)

mult :: Nat -> Nat -> Nat
mult n Zero     = Zero
mult Zero n     = Zero
mult m (Succ n) = add (mult m n) m


--ex2

-- data Ordering = LT | EQ | GT

data Tree2 a = Leaf2 a | Node2 (Tree2 a) a (Tree2 a) deriving (Show)

occurs :: Ord a => a -> Tree2 a -> Bool
occurs x (Leaf2 a)      = compare x a == EQ
occurs x (Node2 l c r)  = compare x c == EQ || occurs x l || occurs x r


--ex3

flatten :: Tree2 a -> [a]
flatten arv =  flatten' arv []


flatten' :: Tree2 a -> [a] -> [a]
flatten' (Leaf2 c) x        = c:x
flatten' (Node2 l c r) x    = flatten' l $ (c :) $ flatten' r x

--ex4

data Tree4 a = Leaf4 a | Node4 (Tree4 a) (Tree4 a)

balanced :: Tree4 a -> Bool
balanced (Leaf4 a)  = True
balanced (Node4 l r) = (>=1) $ abs $ contFolhas l - contFolhas r


contFolhas :: Tree4 a -> Int
contFolhas (Leaf4 a) = 1
contFolhas (Node4 l r) = contFolhas l + contFolhas r 

--ex5

balance :: [a] -> Tree4 a
balance [x] = Leaf4 x
balance x   = Node4 (balance $ fst $ divLista x) (balance $ snd $ divLista x) 

divLista :: [a] -> ([a],[a])
divLista xs = (take middle xs, drop middle xs)
    where
        middle = length xs `quot` 2 

--ex6 
data Expr = Val Int | Add Expr Expr

folde :: (Int -> a) -> (a -> a -> a) -> Expr -> a
folde f g (Val x)   = f x
folde f g (Add x y) = g (folde f g x) (folde f g y)

size :: Expr -> Int
size = undefined

--ex7

eval :: Expr -> Int
eval x = folde id (+) x





--


