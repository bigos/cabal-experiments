module Main where

main :: IO ()
main = do
  putStrLn "Tell me your name"
  name <- getLine
  putStrLn ("Hello " ++ name ++ ", nice to meet you.")
