module Main where
import Test.QuickCheck
--import Test
import Data.List

votos :: [String]
votos = ["Vermelho","Azul","Verde","Azul","Azul","Vermelho"]

-- conta quantos votos o candidato x recebeu
conta :: Eq a => a->[a]->Int
conta e xs = length [x | x <- xs, x == e ]

-- retorna a lista de elementos unicos
-- recebe uma lista com duplicadas e remove elas
unicos :: Eq a => [a]->[a]


-- retorna uma lista de pares ordenados (votos, candidato) com o total
-- de votos obtido por cada candidato use a função sort para ordenar
-- do menos para o mais votado
resultado :: Ord a => [a]->[(Int,a)]
resultado xs = sort( [ (x,y) | (x,y) <- zip (conta x xs) xs] )

-- retorna o vencedor da eleição
vencedor :: Ord a =>[a]->a
vencedor xs = take ((length xs)-1) (resultado xs)


-- segundo método de decisão do vencedor
-- elimina as listas vazias de uma lista de listas
--rmvazio :: Eq a => [[a]]->[[a]]

-- elimina um candidato da lista de votos
--elimina :: Eq a=>a->[[a]]->[[a]]

-- retorna uma lista dos candidatos existentes, do menos para o mais votado
--rank :: Ord a => [[a]]->[a]

-- retorna o vencedor executando o processo descrito acima
--vencedor' :: Ord a =>[[a]]->a

--votosRanks :: [[String]]
--votosRanks = [["Vermelho","Verde"],["Azul"],["Verde","Vermelho","Azul"], ["Azul","Verde","Vermelho"],["Verde"]]

main :: IO ()
main = do
  print $ vencedor  votos
  --print $ vencedor' votosRanks
