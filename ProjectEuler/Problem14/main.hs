collatzSequenceLength :: Int -> Int
collatzSequenceLength x
 	| even x && x > 1 = 1 + (collatzSequenceLength $ x `div` 2)
	| odd x && x > 1 = 1 + (collatzSequenceLength $ 1 + 3 * x)
	| otherwise = 1

findLongestChain :: Int -> (Int, Int) -> (Int, Int)
findLongestChain x winningPair
	| x > 1 =
		if collatzSequenceLength x > (snd winningPair)
		then findLongestChain (x - 1) (x, collatzSequenceLength x)
		else findLongestChain (x - 1) winningPair
	| otherwise = winningPair

solve :: (Int, Int)
solve = findLongestChain 1000000 (0, 0)

main = do
	putStrLn $ show solve
