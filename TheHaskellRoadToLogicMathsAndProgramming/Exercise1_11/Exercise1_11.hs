import Exercise1_8
import Exercise1_10

sortIntegers :: [Integer] -> [Integer]
sortIntegers [] = []
sortIntegers xs = minimum : (sortIntegers $ removeFirst xs minimum)
    where minimum = findMinimum xs

main = do
    print $ sortIntegers [1,6,4,4,12,7,4,3]

-- build with: ghc -i../Exercise1_8 -i../Exercise1_10 Exercise1_11.hs
