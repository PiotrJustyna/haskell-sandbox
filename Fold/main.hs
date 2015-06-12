appendIfOdd x collection
    | odd x = x : collection
    | otherwise = collection

takeOddl = foldl (\accelerator x -> appendIfOdd x accelerator) []
takeOddr = foldr (\x accelerator -> appendIfOdd x accelerator) []

divideSubsequentl1 = foldl1 (\accelerator x -> x / accelerator)
divideSubsequentr1 = foldr1 (\x accelerator -> x / accelerator)

main = do    
    print (show (takeOddl [1..5])) -- prints "[5,3,1]"
    print (show (takeOddr [1..5])) -- prints "[1,3,5]"

    print (show (divideSubsequentl1 [2, 4])) -- prints "2.0"
    print (show (divideSubsequentr1 [2, 4])) -- prints "0.5"
