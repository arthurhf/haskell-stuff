module Test where
import Cesar

-- aplicando shift duas vezes, uma com o valor negativo, o caracter
-- deve ser o mesmo
prop_neg_shift::Int->Char->Bool

-- o tamanho da mensagem codificada deve ser o mesmo da original
prop_enc_length::Int->String->Bool

-- o decode do encode deve ser a string original
prop_enc_dec::Int->String->Bool
