removeFirst :: [Integer] -> Integer -> [Integer]
removeFirst [] _ = error "Collection is empty."
removeFirst [x] m = if (x == m) then [] else [x]
removeFirst (x:xs) m = if (x == m) then xs else (x : removeFirst xs m)

main = do
    print $ removeFirst [1,2,3,4,5,6,7,8,9] 8
