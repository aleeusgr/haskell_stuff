module Main where

printSmallNumber num =
  let msg = if num < 10
      then show num
      else "the number is too big!"
      in print msg

main = printSmallNumber 3 --what the hell this does?

guardSize num
  | num < 3 = "that's a small number"
  | num < 10 = "that's a medium number"
  | num < 100 = "that's a pretty big number"
  | num < 1000 = "wow, that's a giant number"
  | otherwise = "that's an unfathomably big number"
