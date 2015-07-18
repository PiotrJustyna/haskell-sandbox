average :: [Integer] -> Rational
average [] = 0
average xs = (toRational $ sum xs) / (toRational $ length xs)

main = do
  print $ average [1,2,3,4]
