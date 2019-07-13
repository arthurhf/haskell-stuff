# Resolução Lista 1
### Arthur Henrique Fernandes e Gabriel Trettel

##### 1. Coloque parênteses nas seguintes expressões:

``` haskell
2^3*4

2*3+4*5

2+3*4^5

2+3/4-5^6*7 ```
###### Resposta

##### 2. Sem utilizar qualquer ajuda, determine o valor e o tipo retornado poressas expressões. Em seguida, utilize oghcipara confirmar a resposta:
``` haskell
(*9)6

head [(0,"doge"),(1,"kitteh")]

head [(0::Integer,"doge"),(1,"kitteh")]

if False then True else False

length [1,2,3,4,5]

length [1,2,3,4] > length "TACOCAT" ```

###### Resposta

##### 3. Defina uma função para seguinte assinatura:
``` haskell
f :: (a, b) -> (c, d) -> ((b, d), (a, c)) ```

###### Resposta

##### 4. Defina uma função
``` haskell
palindromo :: (Eq a) => [a] -> Bool ```

##### que verifica se uma string (ou lista) é palíndroma, utilizando a função reverse.

###### Resposta
