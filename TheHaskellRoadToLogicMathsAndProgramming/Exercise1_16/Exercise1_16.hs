module Exercise1_16
    (prefix
    ) where

prefix :: String -> String -> Bool
prefix [] ys = True
prefix (x:xs) (y:ys) = if x == y then prefix xs ys else False
prefix _ _ = False
