expression1 :: [String]
expression1 = ["this", "is", "a", "list"]

expression2 :: (Bool, String)
expression2 = (True, "True")

expression3 :: [(Bool, String)]
expression3 = [(True, "True"), (False, "False")]

expression4 :: ([Bool], String)
expression4 = ([True, False], "Both options!")

expression5 :: Bool -> Bool
expression5 True = True
expression5 False = True

main = do
    print $ expression1
    print $ expression2
    print $ expression3
    print $ expression4
    print $ expression5 False
