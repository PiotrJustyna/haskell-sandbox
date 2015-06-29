data MysteriousBox a = IncredibleWealth a | NotMuch deriving Show

instance (Eq a) => Eq (MysteriousBox a) where
    IncredibleWealth x == IncredibleWealth y = x == y
    NotMuch == NotMuch = True
    _ == _ = False

instance Functor MysteriousBox where
    fmap f (IncredibleWealth a) = IncredibleWealth $ f a
    fmap f NotMuch = NotMuch

testFunctorLaw1 = (fmap id $ IncredibleWealth 100) == (id $ IncredibleWealth 100)

testFunctorLaw2 = (fmap (add1 . multiplyBy2) $ IncredibleWealth 100) == fmap add1 (fmap multiplyBy2 $ IncredibleWealth 100)
    where
        multiplyBy2 = (\y -> y * 2)
        add1 = (\x -> x + 1)

main = do
    print $ testFunctorLaw1
    print $ testFunctorLaw2
