addNumberIfEven sum numberToAdd
    | (mod numberToAdd 2) == 0 = sum + numberToAdd
    | otherwise = sum

solve sum current next inclusiveLimit
    | next > inclusiveLimit = addNumberIfEven sum current
    | otherwise = solve (addNumberIfEven sum current) next (current + next) inclusiveLimit

main = do
    print (solve 0 1 2 4000000)
