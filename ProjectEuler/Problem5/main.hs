isFullyDivisable dividend divisor
    | divisor == 11 && evenlyDivisible = True
    | evenlyDivisible = isFullyDivisable dividend (divisor - 1)
    | otherwise = False
    where evenlyDivisible = dividend `mod` divisor == 0


main = do
    print $ head [x | x <- [(2 * 3 * 5 * 7 * 11 * 13 * 17 * 19), 2 * (2 * 3 * 5 * 7 * 11 * 13 * 17 * 19) ..], isFullyDivisable x 20]
