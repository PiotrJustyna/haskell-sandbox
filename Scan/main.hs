appendIfOdd x collection
    | odd x = x : collection
    | otherwise = collection

takeOddl = scanl (\accelerator x -> appendIfOdd x accelerator) []
takeOddr = scanr (\x accelerator -> appendIfOdd x accelerator) []

divideSubsequentl1 = scanl1 (\accelerator x -> x / accelerator)
divideSubsequentr1 = scanr1 (\x accelerator -> x / accelerator)

main = do
    print (show (takeOddl [1..5])) -- prints "[[],[1],[1],[3,1],[3,1],[5,3,1]]"
    print (show (takeOddr [1..5])) -- prints "[[1,3,5],[3,5],[3,5],[5],[5],[]]"

    print (show (divideSubsequentl1 [2, 4])) -- prints "[2.0,2.0]"
    print (show (divideSubsequentr1 [2, 4])) -- prints "[0.5,4.0]"
