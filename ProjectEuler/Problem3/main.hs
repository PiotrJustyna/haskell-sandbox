solve forNumber withPotentialFactor
    | forNumber == withPotentialFactor = withPotentialFactor
    | forNumber `mod` withPotentialFactor == 0 = solve (forNumber `div` withPotentialFactor) 2
    | otherwise = solve forNumber (withPotentialFactor + 1)

main = do
    print (solve 600851475143 2)

-- The solution is very performant now and amazingly simple. I had to do some reading and realised that the fundamental theorem of arithmetic (unique factorization theorem) was the solution here:
--
-- "every integer greater than 1 either is prime itself or is the product of prime numbers, and that this product is unique, up to the order of the factors".
--
-- Please read more here: http://en.wikipedia.org/wiki/Fundamental_theorem_of_arithmetic
