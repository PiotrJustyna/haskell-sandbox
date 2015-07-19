prefix :: String -> String -> Bool
prefix [] ys = True
prefix (x:xs) (y:ys) = if x == y then prefix xs ys else False
prefix _ _ = False

main = do
    print $ prefix "Hell" "Hello!"      -- True
    print $ prefix "Hello!1" "Hello!"   -- False
    print $ prefix "" "Hello!"          -- True
    print $ prefix "Hello!" ""          -- False
