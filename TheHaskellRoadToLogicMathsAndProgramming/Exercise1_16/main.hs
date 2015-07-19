import Exercise1_16

main = do
    print $ prefix "Hell" "Hello!"      -- True
    print $ prefix "Hello!1" "Hello!"   -- False
    print $ prefix "" "Hello!"          -- True
    print $ prefix "Hello!" ""          -- False
