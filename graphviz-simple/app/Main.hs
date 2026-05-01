module Main where

import Data.GraphViz
import Data.GraphViz.Attributes (color, filled, shape, style, textLabel)
import Data.GraphViz.Attributes.Complete (Number (Int))
import Data.GraphViz.Types
import Data.GraphViz.Types.Monadic
  ( GraphID (Num, Str),
    cluster,
    digraph,
    graphAttrs,
    node,
    nodeAttrs,
    (-->),
  )

graph =
  digraph (Str "G") $ do
    cluster (Int 0) $ do
      graphAttrs [style filled, color LightGray]
      nodeAttrs [style filled, color White]
      "a0" --> "a1"
      "a1" --> "a2"
      "a2" --> "a3"
      graphAttrs [textLabel "process #1"]

    cluster (Int 1) $ do
      nodeAttrs [style filled]
      "b0" --> "b1"
      "b1" --> "b2"
      "b2" --> "b3"
      graphAttrs [textLabel "process #2", color Blue]

    "start" --> "a0"
    "start" --> "b0"
    "a1" --> "b3"
    "b2" --> "a3"
    "a3" --> "end"
    "b3" --> "end"

    node "start" [shape MDiamond]
    node "end" [shape MSquare]

main = do
  putStrLn "Tell me your name"
  name <- getLine
  putStrLn ("Hello " ++ name ++ ", nice to meet you.")
