# Resolução Lista 2
### Arthur Henrique Fernandes, [Gabriel Trettel](https://github.com/GabrielTrettel/) e [Eric Stein](https://github.com/GrayJack/)


##### 1. Defina uma função

```haskell
penultimo :: [a] -> a
```

##### que devolve o penúltimo elemento de uma lista, apresentando umamensagem de erro nos casos de lista vazia e lista com apenas um elemento.

###### Resposta
```haskell
penultimo :: [a] -> a
penultimo [] = error "Lista vazia"
penultimo [e] = error "Lista com 1 elemento"
penultimo xs = rev_xs !! 1
    where
        rev_xs = reverse xs
```

***
##### 2. Defina uma função

```haskell
maximoLocal :: [Int] -> [Int]
```

##### que devolve uma lista com os máximos locais de uma lista de inteiros. Um máximo local é um elemento maior que seu antecessor e que seu sucessor. Por exemplo, em [1,3,4,2,5] 4 é um máximo local, mas 5 não,pois não possui sucessor.

###### Resposta

```haskell
--Aqui o patern match é invertido: só queremos que a recursão ocorra enquanto a lista tiver, no mínimo, 3 elementos + um resto (representado pelo xs)
maximoLocal :: [Int] -> [Int]
maximoLocal (x0:x1:x2:xs) = if (x1 > x0 && x1 > x2) then x1:maximoLocal(x1:x2:xs) else maximoLocal (x1:x2:xs)
maximoLocal _ = []
```
***
##### 3. Usando compreensão de listas, defina a função

```haskell
perfeitos :: Int -> [Int]
```

##### que recebe um inteiro n e retorna uma lista dos números perfeitos até n. Um número perfeito é igual à soma de seus fatores, excluindo a si mesmo. O número 28 é perfeito, pois 1 + 2 + 4 + 7 + 14 = 28. Exemplo:

```haskell
perfeitos 500
[6,28,496]
```
###### Resposta
```haskell
perfeitos :: Int -> [Int]
--usando list comprehesion e uma função auxiliar responsável por criar a lista de divisores do número x, excluindo ele próprio
-- ao invés de escrevermos "sum (divisores x)", em haskell podemos escrever "sum $ divisores x"
perfeitos n = [x | x<-[1..n], (sum $ divisores x) == x]

divisores :: Int -> [Int]
divisores num = [x | x<-[1..(num - 1)], (mod num x == 0)]
```
***
##### 4. Defina a função

```haskell
produtoEscalar :: Num a => [a] -> [a] -> a
```

##### que devolve o produto escalar de dois vetores, usando compreensão delistas.

###### Resposta

```haskell
produtoEscalar :: Num a => [a] -> [a] -> a
produtoEscalar a b = foldr (+) 0 mulab
    where
        zipab = zip a b
        mulab = [a * b | (a, b) <- zipab]
```
***
##### 5. Escreva uma função recursiva

```haskell
palindromo :: [Int] -> Bool
```

##### que verifica se os elementos da lista formam um palíndromo.

###### Resposta

```haskell
palindromo :: [Int] -> Bool
palindromo [] = True
palindromo [e] = True
palindromo (x:xs)
    | x == y = palindromo $ init xs
    | otherwise = False
    where (y:ys) = reverse (x:xs)
```
***
##### 6. Defina uma função

```haskell
ordenaListas :: (Num a, Ord a) => [[a]] -> [[a]]
```

##### que ordene uma lista de listas pelo tamanho de suas sublistas.

###### Resposta

```haskell
ordenaListas :: (Num a, Ord a) => [[a]] -> [[a]]
ordenaListas xs = sortOn (length) xs
```
***
##### 7. Mostre como a compreensão de lista

```haskell
coord :: [a] -> [a] -> [(a,a)]
coordx y = [(i,j) | i <- x, j <- y]
```

##### que possui duas funções geradoras, pode ser redefinida com duas listas de compreensão aninhadas, cada uma contendo uma única função geradora.
***
##### 8. O algoritmo de Luhn para a verificação dos dígitos de um cartão decrédito segue os seguintes passos:

##### (a) considere cada dígito como um número

##### (b) a partir da direita, dobre os números alternadamente, começandopelo penúltimo

##### (c) some todos os dígitos dos números

##### (d) se o total for divisível por 10, o número do cartão é válido.

##### Em seguida:

##### (a) Defina as funções

```haskell
digitosRev :: Int -> [Int]
```

##### que converte um inteiro em uma lista contendo seus dígitos na ordem reversa.

###### Resposta
```haskell
digitosRev :: Int -> [Int]
digitosRev 0 = []
digitosRev num = [num `mod` 10] ++ digitosRev (num `div` 10)
```

##### (b) Escreva a função

```haskell
dobroAlternado :: [Int] -> [Int]
```

##### que recebe uma lista de números e dobra a partir da esquerda o segundo, quarto etc, elemento, devolvendo uma lista atualizada. Note que por termos escrito a função anterior para retornar os dígitos invertidos, podemos fazer essa operação da esquerda ao invés de da direita conforme descrição do algoritmo. Por exemplo,para [3,5,6,4] a a saída é [3,10,6,8].

###### Resposta
```haskell
dobroAlternado :: [Int] -> [Int]
dobroAlternado xs = [double_par i e | (i, e) <- zip [1..] xs]
    where
        double_par index e = if (index)`rem`2 == 0 then 2*e else e
```

##### (c) Defina a função
```haskell
somaDigitos :: [Int] -> Int
```

##### que soma todos os dígitos da lista de inteiros. Com o uso função anterior, alguns números possuem dois dígitos, que precisam ser somados individualmente. Exemplo: [6,5,12,4] = 6 + 5 + 1 + 2 + 4 = 18

###### Resposta
```haskell
somaDigitos :: [Int] -> Int
somaDigitos xs = foldr (+) 0 new_xs
    where
        broken_big_num = concat $ map digitosRev $ filter (\n -> n > 9) xs
        new_xs = broken_big_num ++ filter (\n -> n <= 9) xs
```

##### (d) Utilize as funções criadas anteriormente para definir a função
```haskell
luhn :: Int -> Bool
```
##### que verifica se o número é uma sequência válida para um cartão de crédito. Exemplos:

```haskell
>luhn 1784
True
>luhn 4783
False
>luhn 4012888888881881
True
>luhn 4012888888881882
False
```

###### Resposta
```haskell
luhn :: Int -> Bool
luhn n
    | total `rem` 10 == 0 = True
    | otherwise = False
    where
        total = somaDigitos $ dobroAlternado $ digitosRev n
```
