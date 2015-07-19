repeatCharacter :: Char -> Int -> String
repeatCharacter character n = take n $ repeat character

blowupHelper :: String -> Int -> String
blowupHelper [x] repetitions = repeatCharacter x repetitions
blowupHelper (x:xs) repetitions =
    (repeatCharacter x (repetitions - (length xs))) ++ blowupHelper xs repetitions

blowup :: String -> String
blowup stringToBlowUp = blowupHelper stringToBlowUp $ length stringToBlowUp

main = do
    print $ blowup "bang!"
