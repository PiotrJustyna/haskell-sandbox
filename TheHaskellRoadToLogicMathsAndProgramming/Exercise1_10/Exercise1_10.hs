module Exercise1_10
    (removeFirst
    ) where

removeFirst :: [Integer] -> Integer -> [Integer]
removeFirst [] _ = error "Collection is empty."
removeFirst [x] m = if (x == m) then [] else [x]
removeFirst (x:xs) m = if (x == m) then xs else (x : removeFirst xs m)
