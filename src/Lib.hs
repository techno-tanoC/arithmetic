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

eval1 :: Term ->  Maybe Term
eval1 (TmIf TmTrue x _) = pure x
eval1 (TmIf TmFalse _ y) = pure y
eval1 (TmIf b x y) = TmIf <$> eval1 b <*> pure x <*> pure y
eval1 (TmSucc x) = TmSucc <$> eval1 x
eval1 (TmPred TmZero) = pure TmZero
eval1 (TmPred (TmSucc x)) | isnumericval x = pure x
eval1 (TmPred x) = TmPred <$> eval1 x
eval1 (TmIsZero TmZero) = pure TmTrue
eval1 (TmIsZero (TmSucc x)) | isnumericval x = pure TmFalse
eval1 (TmIsZero x) = TmIsZero <$> eval1 x
eval1 x = Nothing

eval :: Term -> Term
eval t = maybe t eval $ eval1 t
