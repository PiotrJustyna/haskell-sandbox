findMinimum :: [String] -> String
findMinimum [] = error "Collection is empty."
findMinimum [x] = x
findMinimum (x:xs) = min x (findMinimum xs)

removeFirst :: [String] -> String -> [String]
removeFirst [] _ = error "Collection is empty."
removeFirst [x] m = if (x == m) then [] else [x]
removeFirst (x:xs) m = if (x == m) then xs else (x : removeFirst xs m)

sortStrings :: [String] -> [String]
sortStrings [] = []
sortStrings xs = minimum : (sortStrings $ removeFirst xs minimum)
    where minimum = findMinimum xs

main = do
    print $ sortStrings ["hijkl", "hello world!", "defg", "abc"]
