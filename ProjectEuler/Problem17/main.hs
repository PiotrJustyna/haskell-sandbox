digitToSpokenWord :: Int -> String
digitToSpokenWord x
  | x == 1 = "one"
  | x == 2 = "two"
  | x == 3 = "three"
  | x == 4 = "four"
  | x == 5 = "five"
  | x == 6 = "six"
  | x == 7 = "seven"
  | x == 8 = "eight"
  | x == 9 = "nine"
  | otherwise = ""

teenNumberToSpotenWord :: Int -> String
teenNumberToSpotenWord x
  | x == 10 = "ten"
  | x == 11 = "eleven"
  | x == 12 = "twelve"
  | x == 13 = "thirteen"
  | x == 14 = "fourteen"
  | x == 15 = "fifteen"
  | x == 16 = "sixteen"
  | x == 17 = "seventeen"
  | x == 18 = "eighteen"
  | x == 19 = "nineteen"
  | otherwise = ""

twoDigitNonTeenNumberToSpokenWord :: Int -> String
twoDigitNonTeenNumberToSpokenWord x
  | x >= 20 && x < 30 = "twenty"
  | x >= 30 && x < 40 = "thirty"
  | x >= 40 && x < 50 = "forty"
  | x >= 50 && x < 60 = "fifty"
  | x >= 60 && x < 70 = "sixty"
  | x >= 70 && x < 80 = "seventy"
  | x >= 80 && x < 90 = "eighty"
  | x >= 90 && x < 100 = "ninety"
  | otherwise = ""

numberToSpokenWords :: Int -> Int -> [String]
numberToSpokenWords x originalNumber
  | x == 1000 = [digitToSpokenWord $ x `div` 1000] ++ ["thousand"]
  | x >= 100 = [digitToSpokenWord $ x `div` 100] ++ ["hundred"] ++ (numberToSpokenWords (x `mod` 100) originalNumber)
  | x >= 20 = toAndOrNotToAnd : [twoDigitNonTeenNumberToSpokenWord x] ++ (numberToSpokenWords (x `mod` 10) x)
  | x >= 10 = toAndOrNotToAnd : [teenNumberToSpotenWord x]
  | x >= 1 = toAndOrNotToAnd : [digitToSpokenWord x]
  | otherwise = []
  where
    toAndOrNotToAnd = if originalNumber > 100 then "and" else ""

solve :: Int -> Int -> Int -> IO ()
solve x y currentTotal
  | x >= 1 && x <= y = do
    putStrLn assembleOutput
    solve (x + 1) y newTotal
  | otherwise = putStrLn ("Answer: " ++ show currentTotal)
  where
    assembleOutput =
      printableSpokenWords ++
      ", current length: " ++
      printableCurrentLength ++
      ", current total length: " ++
      printableNewTotal
    spokenWords = numberToSpokenWords x x
    printableSpokenWords = show spokenWords
    currentLength = foldl (\x y -> length y + x) 0 spokenWords
    printableCurrentLength = show currentLength
    newTotal = currentTotal + currentLength
    printableNewTotal = show newTotal

solveInterface :: IO ()
solveInterface = solve 1 1000 0

main :: IO ()
main = solveInterface
