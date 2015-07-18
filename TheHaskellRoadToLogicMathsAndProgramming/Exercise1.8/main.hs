findMinimum :: [Integer] -> Integer
findMinimum [] = error "Collection is empty."
findMinimum [x] = x
findMinimum (x:xs) = min x (findMinimum xs)

main = do
    print $ findMinimum [1,2,32, 5, 17, 2]
