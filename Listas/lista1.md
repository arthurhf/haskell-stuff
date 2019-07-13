# Resolução Lista 1
### Arthur Henrique Fernandes e Gabriel Trettel

##### 1. Coloque parênteses nas seguintes expressões:

``` haskell
2^3*4

2*3+4*5

2+3*4^5

2+3/4-5^6*7
```

###### Resposta

##### 2. Sem utilizar qualquer ajuda, determine o valor e o tipo retornado poressas expressões. Em seguida, utilize oghcipara confirmar a resposta:
``` haskell
(*9)6

head [(0,"doge"),(1,"kitteh")]

head [(0::Integer,"doge"),(1,"kitteh")]

if False then True else False

length [1,2,3,4,5]

length [1,2,3,4] > length "TACOCAT"
```

###### Resposta

##### 3. Defina uma função para seguinte assinatura:
``` haskell
f :: (a, b) -> (c, d) -> ((b, d), (a, c))
```

###### Resposta

##### 4. Defina uma função
``` haskell
palindromo :: (Eq a) => [a] -> Bool
```

##### que verifica se uma string (ou lista) é palíndroma, utilizando a função reverse.

###### Resposta

##### 5. Mostre que a seguinte função curried pode ser formalizada em termos de expressões lambda:
```haskell
mult :: Int -> Int -> Int -> Int
mult x y z = x*y*z
```
###### Resposta

##### 6. Mostre como o operador || pode ser definido de quatro modos diferentes usando pattern matching.

###### Resposta


##### 7. Sem usar outras bibliotecas, funções ou operadores, mostre que a definição por pattern matching de &&
```haskell
True && True = True
_ && _ = False
```
pode ser formalizada utilizando duas expressões condicionais (if) aninhadas.
###### Resposta


##### 8. Faça o mesmo do exercício anterior para essa definição alternativa de &&:
```haskell
True && b = b
False && _ = False
```
usando dessa vez uma única expressão condicional.
###### Resposta


##### 9. Defina a única função possível para a assinatura
```haskell
c :: a -> b -> a
```
###### Resposta


##### 10. Defina a única função possível para a assinatura
```haskell
co :: (b -> c) -> (a -> b) -> a -> c
```
>>>>>>> 2d04dccaefd16dbb11d11b6f02d99140269f8f7b
###### Resposta
