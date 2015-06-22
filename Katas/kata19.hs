import Data.List

solve startWord endWord dictionary shortestPaths =
    if (elem endWord relatedWords)
        then ((endWord:startWord), (length startWord) + 1):shortestPaths
        else if (any isWordRelated dictionary)
            then foldr (\x acc -> acc ++ solve (x:startWord) endWord newDictionary shortestPaths) [] relatedWords
            else shortestPaths
   where
       isWordRelated = (\x -> (length $ x \\ (head startWord)) == 1)
       relatedWords = filter isWordRelated dictionary
       newDictionary = filter (\x -> x /= (head startWord)) dictionary

main = do
    putStr $ show $ head $ sortBy (\x y -> if snd x > snd y then GT else LT) (solve ["cat"] "dog" ["cog", "dog", "mat", "cot", "cub", "cab", "bog", "meat", "bat", "beat", "bot"] [])
