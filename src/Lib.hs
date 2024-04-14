{-# LANGUAGE TemplateHaskellQuotes #-}

module Lib (tadd, tfib, tid, tif, texp) where

import Language.Haskell.TH

tadd :: Integer -> Integer -> ExpQ
tadd l r = infixE
    (Just $ litE $ integerL l)
    (varE '(+))
    (Just $ litE $ integerL r)

tfib :: Integer -> ExpQ
tfib 1 = litE $ integerL 1
tfib 2 = litE $ integerL 1
tfib n = infixE
    (Just $ tfib (n-1))
    (varE '(+))
    (Just $ tfib (n-2))

tid :: ExpQ -> ExpQ
tid s = s

tif :: ExpQ -> ExpQ
tif s = do
    s' <- runQ s
    case s' of
        (CondE c _ _) -> return c
        _ -> error "Not a conditional expression"

texp :: ExpQ -> ExpQ
texp e = do
    e' <- runQ e
    case e' of
        CondE{} -> stringE "CondE"
        _ -> stringE "!!No match!!"
