isPalindrome number =
    showableNumber == reverse showableNumber
    where showableNumber = show number

solve = maximum [x * y | x <- [999, 998 .. 100], y <- [999, 998 .. x], isPalindrome $ x * y]

main = do
    print $ solve
