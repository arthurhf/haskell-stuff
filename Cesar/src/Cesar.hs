module Cesar where
import Data.Char

-- retorna a n-ésima letra seguinte,
-- evite ultrapassar o limite com `mod` 26
shift :: Int->Char->Char
shift n c
 --n `mod` 26 > 0
 

-- aplica a função shift em cada letra da string
encode::Int->String->String


crack :: String->String
crack xs = encode (-factor) xs
 where
  factor = head (positions (minimum chitab) chitab)
  chitab = [chisqr (rotate n table') table|n<-[0..25]]
  table' = freqs xs

-- quantidade de letras minúsculas em uma String
lowers::String->Int

-- conta a ocorrência de um caracter em uma String
count::Char->String->Int

-- dado um n e m, calcule 100*n/m
percent::Int->Int->Float

-- calcule a porcentagem de cada letra minuscula
-- do alfabeto em uma String
-- a porcentagem é a contagem de ocorrência pelo total
-- de letras minúsculas
freqs::String->[Float]

-- Calcule a medida de Chi-Quadrado de duas
-- tabelas de frequência:
-- Soma (Observado - Esperado)^2 / Esperado
chisqr::[Float]->[Float]->Float

-- rotaciona uma tabela em n posições
rotate::Int->[a]->[a]

-- retorna a lista de posições que contém um
-- elemento x
positions::Eqa=>a->[a]->[Int]

-- converte uma letra minuscula para inteiro
let2int :: Char-> Int
let2int c = ord c - ord'a'
-- converte um inteiro para letra minuscula
int2let::Int->Char
int2letn = chr (ord'a'+n)
table::[Float]
table = [8.1,1.5,2.8,4.2,12.7,2.2,2.0,6.1,7.0,0.2,0.8,4.0,2.4,6.7,7.5,1.9,0.1,6.0,6.3,9.0,2.8,1.0,2.4,0.2,2.0,0.1]
