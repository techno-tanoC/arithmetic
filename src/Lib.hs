module Lib where

data Term = TmTrue
          | TmFalse
          | TmIf Term Term Term
          | TmZero             
          | TmSucc Term
          | TmPred Term        
          | TmIsZero Term
  deriving(Eq, Show)
  
isnumericval :: Term -> Bool
isnumericval TmZero = True
isnumericval (TmSucc t) = isnumericval t
isnumericval _ = False

isval :: Term -> Bool
isval TmTrue = True
isval TmFalse = True
isval t | isnumericval t = True
isval _ = False

eval1 :: Term ->  Term
eval1 (TmIf TmTrue x _) = x
eval1 (TmIf TmFalse _ y) = y
eval1 (TmIf b x y) = TmIf (eval1 b) x y
eval1 (TmSucc x) = TmSucc $ eval1 x
eval1 (TmPred TmZero) = TmZero
eval1 (TmPred (TmSucc x)) | isnumericval x = x
eval1 (TmPred x) = TmPred $ eval1 x
eval1 (TmIsZero TmZero) = TmTrue
eval1 (TmIsZero (TmSucc x)) | isnumericval x = TmFalse
eval1 (TmIsZero x) = TmIsZero $ eval1 x
eval1 x = x

eval :: Term -> Term
eval t =
  let t' = eval1 t
  in if t == t'
    then t'
    else eval t'
