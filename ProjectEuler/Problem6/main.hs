main = do
    print $ foldl (\accelerator x -> accelerator + x) 0 [1..100] ^ 2 - foldl (\accelerator x -> accelerator + x ^ 2) 0 [1..100]
