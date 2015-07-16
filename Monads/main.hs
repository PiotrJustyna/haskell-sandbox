data Context a = Relevant a | Irrelevant deriving Show

instance (Eq a) => Eq (Context a) where
    Relevant x == Relevant y = x == y
    Irrelevant == Irrelevant = True
    _ == _ = False

instance Monad Context where
    return x = Relevant x
    (>>=) (Relevant x) f = f x
    (>>=) Irrelevant _ = Irrelevant

leftIdentity = (return x >>= f) == f x
    where
        f = (\y -> Relevant $ reverse y)
        x = "Nomad"

rightIdentity = (x >>= return) == x
    where
        x = Relevant "Nomad"

associativity = ((x >>= f) >>= g) == (x >>= (\y -> (f y) >>= g))
    where
        x = Relevant "Nomad"
        f = (\y -> Relevant $ reverse y)
        g = (\y -> Relevant $ "reversed: " ++ y)

main = do
    print $ "Left identity test: " ++ (show leftIdentity)
    print $ "Right identity test: " ++ (show rightIdentity)
    print $ "Associativity test: " ++ (show associativity)
