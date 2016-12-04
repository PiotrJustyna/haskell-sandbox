import Data.List

main :: IO ()
main = do
  putStrLn "Amicable Numbers:"
  result <- amicableNumbers 1 10000
  putStrLn $ "Result: " ++ show result
  putStrLn $ "Sum: " ++ show (sum result)

amicableNumbers :: Int -> Int -> IO [Int]
amicableNumbers currentNumber limit
  | currentNumber < limit = do
    putStrLn $ "Current number: " ++ show currentNumber
    isAmicable <- isAmicableNumber currentNumber
    if isAmicable
      then do
        nextResult <- amicableNumbers (currentNumber + 1) limit
        return (currentNumber : nextResult)
      else amicableNumbers (currentNumber + 1) limit
  | otherwise = return []

isAmicableNumber :: Int -> IO Bool
isAmicableNumber x =
  if x == sumOfProperDivisorsOfTheSum &&
    x /= sumOfProperDivisorsOfCurrentNumber
    then do
      putStrLn "Proper divisors:"
      putStrLn $ show properDivisorsOfCurrentNumber
      putStrLn $ "Sum of proper divisors: " ++ (show sumOfProperDivisorsOfCurrentNumber)
      putStrLn "Proper divisors of the sum of proper divisors of current number:"
      putStrLn $ show properDivisorsOfTheSum
      putStrLn $ "Sum of proper divisors of the sum of proper divisors of current number: " ++ (show sumOfProperDivisorsOfTheSum)
      return True
    else return False
  where
    properDivisorsOfCurrentNumber = properDivisors x 1 (x `quot` 2)
    sumOfProperDivisorsOfCurrentNumber = sum properDivisorsOfCurrentNumber
    properDivisorsOfTheSum = properDivisors sumOfProperDivisorsOfCurrentNumber 1 (sumOfProperDivisorsOfCurrentNumber `quot` 2)
    sumOfProperDivisorsOfTheSum = sum properDivisorsOfTheSum

properDivisors :: Int -> Int -> Int -> [Int]
properDivisors dividend divisor limit
  | divisor == 1 = 1 : properDivisors dividend (divisor + 1) limit
  | divisor >= limit = []
  | modulo == 0 = divisor : quotient : properDivisors dividend (divisor + 1) quotient
  | otherwise = properDivisors dividend (divisor + 1) limit
    where
      modulo = dividend `mod` divisor
      quotient = dividend `quot` divisor
