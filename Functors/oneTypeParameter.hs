-- MysteriousBox:
-- you never know what's inside...
-- Open it and you might win:
-- - IncredibleWealth a (wealth of value "a")
-- - NotMuch (broken stick)
data MysteriousBox a = IncredibleWealth a | NotMuch deriving Show

-- MysteriousBox is a functor, so you can take a gamble
-- and apply a function on it before knowing what's inside.
instance Functor MysteriousBox where
    fmap f (IncredibleWealth a) = IncredibleWealth $ f a
    fmap f NotMuch = NotMuch

-- Pay to open the box - get rich or win nothing!
openMysteriousBox openingPrice =
    -- fmap (\x -> (x * openingPrice) ^ 2) $ IncredibleWealth 10  -- we could win, but it wouldn't be interesting then!
    fmap (\x -> (x * openingPrice) ^ 2) $ NotMuch

main = do
    print $ openMysteriousBox 100
