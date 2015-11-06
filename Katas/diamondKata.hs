import Data.Char

formDiamond :: Char -> String
formDiamond startingCharacter
	| index == ord 'A' = [startingCharacter]
	| index < ord 'A' || index > ord 'Z' = "ERROR"
	| otherwise = formUpper ++ "\n" ++ formLower
	where
		index = ord startingCharacter
		formUpper = formUpperPart index index
		formLower = formLowerPart (index - 1) index

formUpperPart :: Int -> Int -> String
formUpperPart current starting
	| current == ord 'A' = formGap (starting - current) ++ [chr current]
	| otherwise = formUpperPart (current - 1) starting ++ "\n" ++ formLine current starting

formLowerPart :: Int -> Int -> String
formLowerPart current starting
	| current == ord 'A' = formGap (starting - current) ++ [chr current]
	| otherwise = formLine current starting ++ "\n" ++ formLowerPart (current - 1) starting

formGap :: Int -> String
formGap size
	| size == 0 = ""
	| otherwise = ' ' : formGap (size - 1)

formLine :: Int -> Int -> String
formLine current starting =
	formGap (starting - current)
	++ [chr current]
	++ formGap ((2 * (current - ord 'A' - 1)) + 1)
	++ [chr current]

main :: IO ()
main = do
	putStrLn $ formDiamond 'Z'
