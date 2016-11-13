main = do
  resultArray <- factorial [1] 100
  putStrLn . show $ foldl (\x y -> x + y) 0 resultArray

factorial :: [Int] -> Int -> IO [Int]
factorial [x] multiplier
  | multiplier == 0 = do
    putStrLn "[1]"
    return [1]
  | otherwise = do
    internalFactorial <- factorial [x] (multiplier - 1)
    putStrLn . show $ (humanReadableFormat internalFactorial) ++ " * " ++ show multiplier ++ " = " ++ show (multiply internalFactorial multiplier 0)
    return $ multiply internalFactorial multiplier 0

multiply :: [Int] -> Int -> Int -> [Int]
multiply [] multiplier carryover = if carryover > 0 then digitsAsArray carryover else []
multiply (x:xs) multiplier carryover = result `mod` 10 : multiply xs multiplier (result `quot` 10)
  where
    result = carryover + x * multiplier

digitsAsArray :: Int -> [Int]
digitsAsArray x
  | x < 10 = [x]
  | otherwise = x `mod` 10 : (if quotient < 10 then [quotient] else (digitsAsArray quotient))
    where
      quotient = x `quot` 10
