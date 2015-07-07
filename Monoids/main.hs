import Data.Monoid

data WeirdHomonym a = Pear a | Pair a a | DoesNotCompute deriving Show

instance Monoid a => Monoid (WeirdHomonym a) where
    mempty = DoesNotCompute
    mappend DoesNotCompute x = x
    mappend x DoesNotCompute = x
    mappend (Pear x) (Pear y) = Pear (x `mappend` y)
    mappend (Pair w x) (Pair y z) = Pair (mappend w y) (mappend x z)
    mappend (Pear _) (Pair _ _) = DoesNotCompute
    mappend (Pair _ _) (Pear _) = DoesNotCompute

main = do
    print $ mappend (Pear "Green Anjou") (Pear "Concorde")
    print $ mappend (Pair "we" "do") (Pair "ll" "ne")
    print $ mappend (Pair "a" "b") (Pear "Bartlett")
