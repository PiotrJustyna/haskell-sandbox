import Data.Numbers.Primes

calculateSum current sum remainingPrimes
	| current < 2000000 = calculateSum (head remainingPrimes) (sum + current) (tail remainingPrimes)
	| otherwise = sum

main = do
	putStrLn . show $ calculateSum 0 0 primes
