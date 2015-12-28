import Data.Bits
import Data.Char

base :: Integer
base = 2

power :: Int
power = 1000

main = putStrLn . show $ foldl (\x y -> digitToInt y + x) 0 (show . shift base $ power - 1)
