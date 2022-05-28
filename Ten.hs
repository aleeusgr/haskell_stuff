--module Main where
x = [1..10]
z = ['a'..'z']
-- 1. last 
myLast x = head $ reverse x

-- 2. but one last

myButLast x = reverse x !! 1

--main x = x
