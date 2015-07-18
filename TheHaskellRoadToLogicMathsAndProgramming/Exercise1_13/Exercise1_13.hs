count :: Char -> String -> Integer
count _ [] = 0
count m [x] = if (m == x) then 1 else 0
count m (x:xs) = count m [x] + (count m xs)

main = do
    print $ count 'l' "Hello"
