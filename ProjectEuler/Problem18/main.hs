puzzle :: [[Int]]
puzzle =
  [[75],
  [95, 64],
  [17, 47, 82],
  [18, 35, 87, 10],
  [20, 04, 82, 47, 65],
  [19, 01, 23, 75, 03, 34],
  [88, 02, 77, 73, 07, 63, 67],
  [99, 65, 04, 28, 06, 16, 70, 92],
  [41, 41, 26, 56, 83, 40, 80, 70, 33],
  [41, 48, 72, 33, 47, 32, 37, 16, 94, 29],
  [53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14],
  [70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57],
  [91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48],
  [63, 66, 04, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31],
  [04, 62, 98, 27, 23, 09, 70, 98, 73, 93, 38, 53, 60, 04, 23]]

scanRow :: Int -> Int -> [Int] -> [Int]
scanRow rowIndex columnIndex nextRow
  | columnIndex < length (puzzle !! rowIndex) = combinedPaths : scanRow rowIndex (columnIndex + 1) nextRow
  | otherwise = []
  where
    combinedPaths = puzzle !! rowIndex !! columnIndex + maximum [nextRow !! columnIndex, nextRow !! (columnIndex + 1)]

scanPuzzle :: Int -> [Int] -> [[Int]]
scanPuzzle rowIndex nextRow
  | rowIndex == 0 = (scanRow rowIndex 0 nextRow) : [nextRow]
  | rowIndex > 0 = (scanPuzzle (rowIndex - 1) $ scanRow rowIndex 0 nextRow) ++ [nextRow]
  | otherwise = [nextRow]

scanPuzzleInterface :: [[Int]]
scanPuzzleInterface = scanPuzzle (length puzzle - 2) $ puzzle !! (length puzzle - 1)

-- optional
findShortestPath :: Int -> Int -> [[Int]] -> [Int]
findShortestPath rowIndex columnIndex scannedPuzzle
  | rowIndex == 0 = scannedPuzzle !! 0 !! 0 : findShortestPath (rowIndex + 1) 0 scannedPuzzle
  | rowIndex < length scannedPuzzle =
    if scannedPuzzle !! rowIndex !! columnIndex > scannedPuzzle !! rowIndex !! (columnIndex + 1)
    then (parentNode - scannedPuzzle !! rowIndex !! columnIndex) : findShortestPath (rowIndex + 1) columnIndex scannedPuzzle
    else (parentNode - scannedPuzzle !! rowIndex !! (columnIndex + 1)) : findShortestPath (rowIndex + 1) (columnIndex + 1) scannedPuzzle
  | otherwise = [puzzle !! (rowIndex - 1) !! columnIndex]
  where
    parentNode = scannedPuzzle !! (rowIndex - 1) !! columnIndex

solve :: [Int]
solve = findShortestPath 0 0 scanPuzzleInterface

main :: IO ()
main = putStrLn . show $ solve
