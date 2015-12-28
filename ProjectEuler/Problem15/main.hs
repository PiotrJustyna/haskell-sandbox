import Data.Map

puzzleSize = 21

solve i j puzzle
  | i == 0 && j == 0 = solve (i + 1) j $ insert (i, j) 0 puzzle
  | i < puzzleSize && j == 0 = solve (i + 1) j $ insert (i, j) 1 puzzle
  | i == puzzleSize && (j + 1) < puzzleSize = solve 1 (j + 1) $ insert (0, j + 1) 1 puzzle
  | i < puzzleSize && j < puzzleSize =
    solve (i + 1) j $ insert (i, j) ((puzzle ! (i - 1, j)) + (puzzle ! (i, j - 1))) puzzle
  | otherwise = puzzle

solveInterface = solve 0 0 empty

main = do
  putStrLn . show $ solveInterface ! (puzzleSize - 1, puzzleSize - 1)
