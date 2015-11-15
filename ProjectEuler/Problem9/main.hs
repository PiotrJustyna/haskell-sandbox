solve :: Int -> Int -> Int
solve a b
	| sum == 1000 ^ 2 = product
	| otherwise = if (a < b - 1) then solve (a + 1) b else solve 1 (b + 1)
	where
		c = floor (sqrt $ fromIntegral $ a ^ 2 + b ^ 2)
		sum = 2000 * a + 2000 * b - 2 * a * b
		product = a * b * c

main = do
	putStrLn . show $ solve 1 2
