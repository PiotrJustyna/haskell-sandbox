getDivisors :: Int -> Int -> Int -> Int
getDivisors dividend potentialDivisor upperLimit
	| potentialDivisor >= upperLimit = 0
  | potentialDivisor < upperLimit && dividend `mod` potentialDivisor == 0 =
    2 + getDivisors dividend (potentialDivisor + 1) (dividend `div` potentialDivisor)
  | otherwise = getDivisors dividend (potentialDivisor + 1) upperLimit

getDivisorsInterface :: Int -> Int
getDivisorsInterface dividend = 2 + getDivisors dividend 2 dividend

solve :: Int -> Int -> Int
solve currentTriangleNumber currentNaturalNumber
	| (getDivisorsInterface currentTriangleNumber) >= 500 = currentTriangleNumber
	| otherwise =
	solve (currentTriangleNumber + currentNaturalNumber) (currentNaturalNumber + 1)

solveInterface :: Int
solveInterface = solve 3 3

main = do
	putStrLn . show $ solveInterface
