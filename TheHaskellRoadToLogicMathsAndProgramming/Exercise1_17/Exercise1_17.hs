import Exercise1_16

substring :: String -> String -> Bool
substring xs [] = False
substring xs [y] = prefix xs [y]
substring xs (y:ys) = if (prefix xs (y:ys)) then True else substring xs ys

main = do
    print $ substring "Hell" " Hello!"     -- True
    print $ substring "Hello!1" "Hello!"   -- False
    print $ substring "" "Hello!"          -- True
    print $ substring "Hello!" ""          -- False
    print $ substring "a" "a"              -- True
    print $ substring "Hello" "h"          -- False

-- build with: ghc -i../Exercise1_16 Exercise1_17.hs
