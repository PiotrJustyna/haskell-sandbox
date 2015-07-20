lengths :: [[a]] -> [Int]
lengths [] = [0]
lengths [x] = [length x]
lengths (x:xs) = (length x) : lengths xs

main = do
    print $ lengths ["Hello", "World!"]
    print $ lengths []
