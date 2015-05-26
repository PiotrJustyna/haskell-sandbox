isPrime potentialFactor testedNumber
    | potentialFactor > (testedNumber `div` 2) = True
    | testedNumber `mod` potentialFactor == 0 = False
    | otherwise = isPrime (potentialFactor + 1) testedNumber

findLargestPrimeFactor currentlyTestedNumber ofNumber
    | currentlyTestedNumber > (ofNumber `div` 2) = 1
    | ofNumber `mod` currentlyTestedNumber == 0 && isPrime 2 (ofNumber `div` currentlyTestedNumber) = ofNumber `div` currentlyTestedNumber
    | otherwise = findLargestPrimeFactor (currentlyTestedNumber + 2) ofNumber

solve forNumber
    | forNumber `mod` 2 == 0 = findLargestPrimeFactor 2 forNumber
    | otherwise = findLargestPrimeFactor 3 forNumber

main = do
    print (solve 600851475143)
