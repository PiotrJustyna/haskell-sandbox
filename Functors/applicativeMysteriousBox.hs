import Control.Applicative

data MysteriousBox a = IncredibleWealth a | NotMuch deriving Show

instance (Eq a) => Eq (MysteriousBox a) where
    IncredibleWealth x == IncredibleWealth y = x == y
    NotMuch == NotMuch = True
    _ == _ = False

instance Functor MysteriousBox where
    fmap f (IncredibleWealth x) = IncredibleWealth $ f x
    fmap f NotMuch = NotMuch

instance Applicative MysteriousBox where
    pure x = IncredibleWealth x
    (IncredibleWealth x) <*> y = fmap x y
    NotMuch <*> _ = NotMuch

testFunctorLaw1 = (fmap id $ IncredibleWealth 100) == (id $ IncredibleWealth 100)

testFunctorLaw2 = (fmap (add1 . multiplyBy2) $ IncredibleWealth 100) == fmap add1 (fmap multiplyBy2 $ IncredibleWealth 100)
    where
        multiplyBy2 = (\y -> y * 2)
        add1 = (\x -> x + 1)

main = do
    print $ testFunctorLaw1
    print $ testFunctorLaw2
    print $ (IncredibleWealth (\x -> negate x)) <*> IncredibleWealth 3

-- I used to associate MysteriousBox only with a repository of values.
-- Now I think of it as of a repository of values or functions.
