-- head :: [a] -> a
-- last :: [a] -> a
-- init :: [a] -> [a]
-- fst :: (a, b) -> a
-- (++) :: [a] -> [a] -> [a]
-- flip :: (a -> b -> c) -> b -> a -> c
-- flip (++) :: [a] -> [a] -> [a]

main = do
    print $ head ['a', 'b', 'c']            -- 'a'
    print $ last ['a', 'b', 'c']            -- 'c'
    print $ init ['a', 'b', 'c']            -- "ab"
    print $ fst ('a', 'b')                  -- 'a'
    print $ (++) "Hello " "World!"          -- "Hello World!"
    print $ flip (\x y -> x / y) 4.0 8.0    -- 2.0 (not 0.5)
    print $ flip (++) "Hello" "World! "     -- "World! Hello"
