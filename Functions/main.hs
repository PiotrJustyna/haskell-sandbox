functionApplication = print $ show $ head $ map (5*) [1..3]
noFunctionApplication = print (show (head (map (5*) [1..3])))

-- class constraints needed in this case
functionComposition :: (Show a, Num a) => [a] -> IO ()
functionComposition = print . show . head . map (5*)
-- no function composition would look like noFunctionApplication

main = do
    functionApplication         -- prints "5"
    noFunctionApplication       -- prints "5"
    functionComposition [1..3]  -- prints "5"
