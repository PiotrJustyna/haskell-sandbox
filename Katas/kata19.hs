import Data.List
import Data.Foldable

solve startWord endWord dictionary =
    if (Data.List.elem endWord relatedWords)
        then [((endWord:startWord), (length startWord) + 1)]
        else if (Data.List.any isWordRelated dictionary)
            then foldr' (\x acc -> acc ++ solve (x:startWord) endWord newDictionary) [] relatedWords
            else []
   where
       isWordRelated = (\x -> (length $ x \\ (head startWord)) == 1)
       relatedWords = filter isWordRelated dictionary
       newDictionary = filter (\x -> x /= (head startWord)) dictionary

main = do
    putStr $ show $ head $ sortBy (\x y -> if snd x > snd y then GT else LT) (solve ["cat"] "dog" ["cog", "dog", "mat", "cot", "cub", "cab", "bog", "meat", "bat", "beat", "bot"])
