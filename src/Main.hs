module MainwhereimportTest.QuickCheck
import Cesar
import Test
main::IO()
main = do 
 let code = encode3 "adoro haskell" 
  dec = encode (-3) code
  cracked = crack code
 print ("Codificado: "++code)
 print ("Decodificado: "++dec)
 print ("Crackeado: "++cracked)
 quickCheck prop_neg_shift
 quickCheck prop_enc_length
