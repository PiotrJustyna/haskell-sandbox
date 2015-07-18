module Exercise1_9
    (findMaximum
    ) where

findMaximum :: [Integer] -> Integer
findMaximum [] = error "Collection is empty."
findMaximum [x] = x
findMaximum (x:xs) = max x (findMaximum xs)
