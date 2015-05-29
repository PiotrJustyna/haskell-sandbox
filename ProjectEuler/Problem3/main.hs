solve forNumber withPotentialFactor
    | forNumber == withPotentialFactor = withPotentialFactor
    | forNumber `mod` withPotentialFactor == 0 = solve (forNumber `div` withPotentialFactor) 2
    | otherwise = solve forNumber (withPotentialFactor + 1)

main = do
    print (solve 600851475143 2)
