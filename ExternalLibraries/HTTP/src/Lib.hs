{-# LANGUAGE OverloadedStrings #-}

module Lib
    ( simpleGet
    ) where

import qualified Data.ByteString.Lazy.Char8 as L8
import           Network.HTTP.Simple

simpleGet :: IO ()
simpleGet = do
    response <- httpLBS "http://httpbin.org/get"
    putStrLn $ "status code: " ++ show (getResponseStatusCode response)
    putStrLn "header: "
    print $ getResponseHeader "Content-Type" response
    putStrLn "body: "
    L8.putStrLn $ getResponseBody response
