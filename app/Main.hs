module Main where

import Lib

-- TmZeroに評価される
term1 :: Term
term1 = TmIf TmTrue TmZero (TmSucc TmZero)

-- TmSucc TmZeroに評価される
term2 :: Term
term2 = TmIf TmFalse TmZero (TmSucc TmZero)

-- TmZeroに評価される
term3 :: Term
term3 = TmPred (TmSucc TmZero)

-- TmTrueに評価される
term4 :: Term
term4 = TmIsZero TmZero

-- TmFalseに評価される
term5 :: Term
term5 = TmIsZero (TmSucc TmZero)

-- TmFalseに評価される
term6 :: Term
term6 = TmIf (TmIsZero TmZero) TmFalse TmTrue

main :: IO ()
main = print $ eval term1
