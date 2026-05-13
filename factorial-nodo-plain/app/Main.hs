module Main (main) where

import Text.Read (readMaybe)

factorialLimit :: Integer
factorialLimit = 15

factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

main :: IO ()
main =
  putStrLn "Printing  factorial"
    >> putStrLn ("enter number for factorial, but do not exceed " ++ show factorialLimit)
    >> getLine >>= \readLimit ->
      case (readMaybe readLimit :: Maybe Integer) of
        Nothing -> putStrLn "You did not enter a number"
        Just limit ->
          if limit < 1
            then putStrLn "please enter 1 or more"
            else
              if limit > factorialLimit
                then putStrLn ("You exceeded the limit, please do not enter anything above " ++ show factorialLimit)
                else putStrLn ("calculated factorial: " ++ show (factorial limit))
