module Main where

main :: IO ()
main   =
  putStrLn "Hello user! Who are you?"  >>
  putStrLn "tell me your first name"    >>
  getLine >>= \firstname ->
  putStrLn                "tell me your surname"        >>
  getLine >>= \surname ->
  putStrLn ("Oh, nice to meet you Mr " ++ firstname ++ " " ++ surname)
