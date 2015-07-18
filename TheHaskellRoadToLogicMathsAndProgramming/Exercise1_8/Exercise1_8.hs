module Exercise1_8
    (findMinimum
    ) where

findMinimum :: [Integer] -> Integer
findMinimum [] = error "Collection is empty."
findMinimum [x] = x
findMinimum (x:xs) = min x (findMinimum xs)
