import Data.Monoid

data WeirdHomonym a = Pear a | Pair a a | DoesNotCompute deriving (Show, Eq)

instance Monoid a => Monoid (WeirdHomonym a) where
    mempty = DoesNotCompute
    mappend DoesNotCompute x = x
    mappend x DoesNotCompute = x
    mappend (Pear x) (Pear y) = Pear (x `mappend` y)
    mappend (Pair w x) (Pair y z) = Pair (mappend w y) (mappend x z)
    mappend (Pear _) (Pair _ _) = DoesNotCompute
    mappend (Pair _ _) (Pear _) = DoesNotCompute

testMonoidLaw1 = mappend mempty x == x where x = Pear "Forelle"

testMonoidLaw2 = mappend x mempty == x where x = Pear "Forelle"

testMonoidLaw3 = mappend x (mappend y z) == mappend (mappend x y) z
    where
        x = Pear "Forelle"
        y = Pear "Seckel"
        z = Pear "Starkrimson"

main = do
    print $ mappend (Pear "Green Anjou") (Pear "Concorde")
    print $ mappend (Pair "we" "do") (Pair "ll" "ne")
    print $ mappend (Pair "a" "b") (Pear "Bartlett")
    print $ testMonoidLaw1
    print $ testMonoidLaw2
    print $ testMonoidLaw3
