import Test.QuickCheck

main :: IO ()
main = do
    print $ "First test: verifies string inversion."
    quickCheck verifyInversion

invertAWord :: String -> String
invertAWord word = reverse word

verifyInversion :: String -> Bool
verifyInversion verifiedWord = reverse verifiedWord == invertAWord verifiedWord

-- build with:
-- ghc -package-db=.cabal-sandbox\x86_64-windows-ghc-7.10.2-packages.conf.d test1.hs
