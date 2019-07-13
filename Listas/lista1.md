# Resolução Lista 1
### Arthur Henrique Fernandes e Gabriel Trettel


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
###### Resposta
