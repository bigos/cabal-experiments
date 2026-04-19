module Main where

main :: IO ()
main =
  putStrLn "What is your name?"
    >> getLine
    >>= \name -> putStrLn ("Oh, " ++ name ++ ", nice talking to you")
