{-# LANGUAGE TemplateHaskellQuotes #-}

module Lib (tadd, tfib, tid) where

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
