main :: IO ()
main = do
  putStrLn $ "Amicable Numbers: " ++ (show $ sumOfAmicableNumbers 1 10000)

sumOfAmicableNumbers :: Int -> Int -> Int
sumOfAmicableNumbers currentNumber limit
  | currentNumber < limit && isAmicableNumber currentNumber =
    currentNumber + sumOfAmicableNumbers (currentNumber + 1) limit
  | currentNumber < limit =
    sumOfAmicableNumbers (currentNumber + 1) limit
  | otherwise = 0

isAmicableNumber :: Int -> Bool
isAmicableNumber x = x == sumOfProperDivisorsOfTheSum && x /= sumOfProperDivisorsOfCurrentNumber
  where
    sumOfProperDivisorsOfCurrentNumber = sumOfProperDivisors x 1 (x `quot` 2)
    sumOfProperDivisorsOfTheSum = sumOfProperDivisors sumOfProperDivisorsOfCurrentNumber 1 (sumOfProperDivisorsOfCurrentNumber `quot` 2)

sumOfProperDivisors :: Int -> Int -> Int -> Int
sumOfProperDivisors dividend divisor limit
  | divisor == 1 = 1 + sumOfProperDivisors dividend (divisor + 1) limit
  | divisor >= limit = 0
  | modulo == 0 = divisor + quotient + sumOfProperDivisors dividend (divisor + 1) quotient
  | otherwise = sumOfProperDivisors dividend (divisor + 1) limit
    where
      modulo = dividend `mod` divisor
      quotient = dividend `quot` divisor
