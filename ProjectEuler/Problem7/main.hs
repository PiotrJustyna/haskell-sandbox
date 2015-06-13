generatePrimes primes potentialPrime limit
    | length primes == limit = primes
    | all (\x -> potentialPrime `mod` x /= 0) primes = generatePrimes (potentialPrime : primes) newPotentialPrime limit
    | otherwise = generatePrimes primes newPotentialPrime limit
    where newPotentialPrime = potentialPrime + 2

main = do
    print $ head $ generatePrimes [2,3] 5 10000
