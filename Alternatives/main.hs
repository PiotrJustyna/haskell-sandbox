import Control.Applicative

main = do
    -- empty
    print $ (empty :: Maybe Char)               -- prints "Nothing"

    -- <|>
    print $ (Just 2 <|> Just 3)                 -- prints "Just 2"
    print $ (Nothing <|> Just 3)                -- prints "Just 3"
    print $ (Just 2 <|> Nothing)                -- prints "Just 2"
    print $ (Nothing <|> Nothing :: Maybe Int)  -- prints "Nothing"
