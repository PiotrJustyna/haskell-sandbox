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

testFunctorLaw2 = (fmap (add1 . (multiplyBy2)) $ IncredibleWealth 100) == fmap add1 (fmap multiplyBy2 $ IncredibleWealth 100)
    where
        multiplyBy2 = (*2)
        add1 = (+1)

-- identity
-- pure id <*> v = v
testApplicativeFunctorLaw1 = (IncredibleWealth id <*> v) == v
    where
        v = IncredibleWealth 100

-- composition
-- pure (.) <*> u <*> v <*> w = u <*> (v <*> w)
testApplicativeFunctorLaw2 = (IncredibleWealth (.) <*> u <*> v <*> w) == (u <*> (v <*> w))
    where
        u = IncredibleWealth (+1)
        v = IncredibleWealth (*2)
        w = IncredibleWealth 2

-- homomorphism
-- pure f <*> pure x = pure (f x)
testApplicativeFunctorLaw3 = (IncredibleWealth f <*> IncredibleWealth x) == IncredibleWealth (f x)
    where
        f = (+2)
        x = 3

-- interchange
-- u <*> pure y = pure ($ y) <*> u
testApplicativeFunctorLaw4 = (u <*> pure y) == (pure ($ y) <*> u)
    where
        u = IncredibleWealth (*3)
        y = 2

main = do
    print $ "Functor Law 1 Test: " ++ show testFunctorLaw1
    print $ "Functor Law 2 Test: " ++ show testFunctorLaw2
    print $ "Applicative Functor Law 1 Test (identity): " ++ show testApplicativeFunctorLaw1
    print $ "Applicative Functor Law 2 Test (composition): " ++ show testApplicativeFunctorLaw2
    print $ "Applicative Functor Law 3 Test (homomorphism): " ++ show testApplicativeFunctorLaw3
    print $ "Applicative Functor Law 4 Test (interchange): " ++ show testApplicativeFunctorLaw4