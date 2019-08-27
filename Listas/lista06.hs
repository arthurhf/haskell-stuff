--ex1 
--definir o Functor para o tipo abaixo:
data Tree a = Leaf | Node  (Tree a) a (Tree a) deriving Show

instance Functor Tree where
  fmap :: (a -> b) -> Tree a -> Tree b
  -- folha -> retornamos folha novamente
  fmap _ Leaf = Leaf
  -- nó -> retornamos um outro nó com f aplicada nos ramos da esquerda
  -- e da direita, e no elemento central
  fmap f (Node l c r) = Node (fmap f l) (f c) (fmap f r)

--ex2

newtype ZipList a = Z [a] deriving Show

instance Functor ZipList where
    fmap :: (a -> b) -> ZipList a -> ZipList b
    fmap g (Z xs) = undefined

instance Applicative ZipList where
    pure :: a -> ZipList a
    pure x = Z x -- ?

--ex3
data Expr a = Var a | Val Int | Add (Expr a) (Expr a) deriving Show

instance Functor Expr where
    fmap :: (a -> b) -> Expr a -> Expr b
    fmap = undefined

instance Applicative Expr where 
    pure :: a -> Expr a
    pure = undefined

instance Monad Expr where
    (>>=) :: Expr a -> (a -> Expr b) -> Expr b
    (>>=) = undefined 


--ex4 

newtype Identity a = Identity a

instance Functor Identity where
    fmap = undefined

instance Applicative Identity where
    pure = undefined

instance Monad Identity where
    (>>=) = undefined

data Pair a = Pair a a

instance Functor Pair where
    fmap = undefined

instance Applicative Pair where
    pure = undefined

instance Monad Pair where
    (>>=) = undefined
