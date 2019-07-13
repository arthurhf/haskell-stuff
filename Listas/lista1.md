# Resolução Lista 1
### Arthur Henrique Fernandes e [Gabriel Trettel](https://github.com/GabrielTrettel/)

##### 1. Coloque parênteses nas seguintes expressões:

``` haskell
(2^3)*4

2*3+4*5

2+3*4^5

2+3/4-5^6*7
```

###### Resposta

``` haskell
(2^3)*4

(2*3)+(4*5)

2+(3*(4^5))

2+(3/4)-((5^6)*7)
```


***


##### 2. Sem utilizar qualquer ajuda, determine o valor e o tipo retornado por essas expressões. Em seguida, utilize o *ghci* para confirmar a resposta:
``` haskell
(*9)6

head [(0,"doge"),(1,"kitteh")]

head [(0::Integer,"doge"),(1,"kitteh")]

if False then True else False

length [1,2,3,4,5]

length [1,2,3,4] > length "TACOCAT"
```

###### Resposta

``` haskell
(*9)6 = 54, tipo Num (Int)

head [(0,"doge"),(1,"kitteh")] = (0, "dodge"), tipo Tuple (Num, [Char])

head [(0::Integer,"doge"),(1,"kitteh")] = (0,"doge"), tipo Tuple (Integer, [Char])

if False then True else False = False, tipo Bool

length [1,2,3,4,5] = 5, tipo Int

length [1,2,3,4] > length "TACOCAT" = False, tipo Bool
```


***


##### 3. Defina uma função para seguinte assinatura:
``` haskell
f :: (a, b) -> (c, d) -> ((b, d), (a, c))
```

###### Resposta

``` haskell
f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f (a,b) (c, d) = ((b, d), (a, c))
```


***


##### 4. Defina uma função
``` haskell
palindromo :: (Eq a) => [a] -> Bool
```
##### que verifica se uma string (ou lista) é palíndroma, utilizando a função reverse.
###### Resposta
Uma versão mais simples que não leva em conta se o caractere é maiúsculo ou não
```haskell  
palindrome :: [a] -> Bool
palindrome [] = False
palindrome p = p == (reverse p)
```
Uma versão um pouco mais robusta:
```haskell
import Data.Char

palindrome :: String -> Bool
palindrome "" = False
palindrome p = and [(toLower c1) == (toLower c2) | (c1,c2) <- (zip p (reverse p))]
```


***


##### 5. Mostre que a seguinte função curried pode ser formalizada em termos de expressões lambda:
```haskell
mult :: Int -> Int -> Int -> Int
mult x y z = x*y*z
```
###### Resposta
```haskell
mult :: Int -> (Int -> (Int -> Int))
mult = \x y z -> x*y*z
```

***


##### 6. Mostre como o operador || pode ser definido de quatro modos diferentes usando pattern matching.
###### Resposta
```haskell
(||) :: Bool -> Bool -> Bool
(||) True _ = True
(||) _ True = True
(||) False False = False
```


***


##### 7. Sem usar outras bibliotecas, funções ou operadores, mostre que a definição por pattern matching de &&
```haskell
True && True = True
_ && _ = False
```
##### pode ser formalizada utilizando duas expressões condicionais (if) aninhadas.
###### Resposta
```haskell
(&&) :: Bool -> Bool -> Bool
(&&) a b = if a then (if b then True else False) else False
```


***


##### 8. Faça o mesmo do exercício anterior para essa definição alternativa de &&:
```haskell
True && b = b
False && _ = False
```
##### usando dessa vez uma única expressão condicional.

###### Resposta
```haskell
(&&) :: Bool -> Bool -> Bool
(&&) a b = if a then b else False
```


***


##### 9. Defina a única função possível para a assinatura
```haskell
c :: a -> b -> a
```
###### Resposta
```haskell
c :: a -> b -> a
c a b = a
```


***


##### 10. Defina a única função possível para a assinatura
```haskell
co :: (b -> c) -> (a -> b) -> a -> c
```
###### Resposta
```haskell
co :: (b -> c) -> (a -> b) -> a -> c
co f g n = f (g n)
```
