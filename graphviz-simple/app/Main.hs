{-# LANGUAGE OverloadedStrings #-}

module Main where

import Data.GraphViz
import Data.GraphViz.Attributes
  ( color,
    filled,
    shape,
    style,
    textLabel,
  )
import Data.GraphViz.Attributes.Complete
  ( Color (..),
    Number (Int),
    Shape (..),
    StyleItem (..),
  )
import Data.GraphViz.Printing (renderDot, toDot)
import Data.GraphViz.Types.Monadic
  ( GraphID (Str),
    cluster,
    digraph,
    graphAttrs,
    node,
    nodeAttrs,
    (-->),
  )
import Data.Text.Lazy.IO qualified as T
import Prelude hiding (Int)

-- avoid clash with GraphViz Int

graph =
  digraph (Str "G") $
    do
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

main :: IO ()
main = do
  T.writeFile "/tmp/graph.dot" (renderDot (toDot graph))
  putStrLn "Tell me your name"
  name <- getLine
  putStrLn ("Hello " ++ name ++ ", nice to meet you.")
