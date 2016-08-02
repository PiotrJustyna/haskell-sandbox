{-# LANGUAGE OverloadedStrings #-}

module Lib
    ( simpleGet,
      receiveJson,
      postRequest
    ) where

import Data.Aeson (Value)
import qualified Data.ByteString.Lazy.Char8 as L8
import qualified Data.ByteString.Char8 as S8
import qualified Data.Yaml as Yaml
import Network.HTTP.Simple

simpleGet :: IO ()
simpleGet = do
  response <- httpLBS "http://httpbin.org/get"
  putStrLn $ "status code: " ++ show (getResponseStatusCode response)
  putStrLn "header:"
  print $ getResponseHeader "Content-Type" response
  putStrLn "body:"
  L8.putStrLn $ getResponseBody response

receiveJson :: IO ()
receiveJson = do
  response <- httpJSON "http://httpbin.org/get"
  putStrLn $ "status code: " ++ show (getResponseStatusCode response)
  putStrLn "header:"
  print $ getResponseHeader "Content-Type" response
  putStrLn "body:"
  S8.putStrLn $ Yaml.encode (getResponseBody response :: Value)

postRequest :: IO ()
postRequest = do
  request <- parseRequest "POST http://httpbin.org/post"
  response <- httpJSON request -- equivalent to httpJSON "POST http://httpbin.org/post"
  putStrLn $ "status code: " ++ show (getResponseStatusCode response)
  putStrLn "header:"
  print $ getResponseHeader "Content-Type" response
  putStrLn "body:"
  S8.putStrLn $ Yaml.encode (getResponseBody response :: Value)
