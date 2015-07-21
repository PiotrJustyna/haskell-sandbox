sumLengths :: [[a]] -> Int
sumLengths [] = 0
sumLengths [x] = length x
sumLengths (x:xs) = length x + sumLengths xs

main = do
    print $ sumLengths ["Hello", "World!"]
    print $ sumLengths []
