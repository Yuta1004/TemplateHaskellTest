{-# LANGUAGE TemplateHaskell #-}

module Main (main) where

import Lib (tadd, tfib, tid)

p :: [String] -> IO ()
p xs =
    let innerP = mapM_ putStr
        xsLn = xs ++ ["\n"]
    in innerP xsLn

main :: IO ()
main = do
    p ["tadd 1 2 = ", show $(tadd 1 2)]
    p ["tfib 25 = ", show $(tfib 25)]
    p ["tid [| if True then 1 else 0 |] = ", show $(tid [| if True then 1 else 0 |])]
