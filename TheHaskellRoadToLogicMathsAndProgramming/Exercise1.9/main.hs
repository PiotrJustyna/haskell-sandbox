findMaximum :: [Integer] -> Integer
findMaximum [] = error "Collection is empty."
findMaximum [x] = x
findMaximum (x:xs) = max x (findMaximum xs)

main = do
    print $ findMaximum [1,2,32, 5, 17, 2]
