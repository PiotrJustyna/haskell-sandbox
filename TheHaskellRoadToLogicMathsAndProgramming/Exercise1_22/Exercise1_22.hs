-- checks whether potentialDivisor divides numberToBeDivided
doesDivide :: Integer -> Integer -> Bool
doesDivide potentialDivisor numberToBeDivided = rem numberToBeDivided potentialDivisor == 0

-- convenience function
-- brutally goes from a given k to n^(0.5)
leastNaturalDivisor' :: Integer -> Integer -> Integer
leastNaturalDivisor' potentialDivisor ofANumber
    | doesDivide potentialDivisor ofANumber = potentialDivisor
    | potentialDivisor^2 > ofANumber = ofANumber
    | otherwise = leastNaturalDivisor' (potentialDivisor + 1) ofANumber

-- find the least natural divisor of a number
leastNaturalDivisor :: Integer -> Integer
leastNaturalDivisor ofANumber = leastNaturalDivisor' 2 ofANumber

-- is the number's least natural divisor that very same number?
prime0 :: Integer -> Bool
prime0 potentialPrime
    | potentialPrime < 1 = error "Not a positive integer."
    | potentialPrime == 1 = False
    | otherwise = leastNaturalDivisor potentialPrime == potentialPrime

primes :: [Integer]
primes = filter prime0 [2..10] -- changed the range to be finite

main = do
    print $ primes
