{-#LANGUAGE DeriveDataTypeable#-}

import Control.Exception
import Data.Typeable (Typeable)

data HelloWorldException = HelloWorldException deriving (Show, Typeable)

instance Exception HelloWorldException

troublemaker :: Int -> IO ()
troublemaker x = if x == 0 then throw HelloWorldException else putStrLn $ show x

main :: IO ()
main = do
	catch (troublemaker 0) (\e -> putStrLn $ "Caught " ++ show (e :: HelloWorldException))
	catch (troublemaker 1) (\e -> putStrLn $ "Caught " ++ show (e :: HelloWorldException))
