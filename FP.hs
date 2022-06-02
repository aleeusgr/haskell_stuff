-- https://youtube.com/playlist?list=PLF1Z-APd9zK7usPMx3LGMZEHrECUGodd3
-- using functions from FP L4
-- define `last` in two ways. gets the last element of the list
-- define `init` in two ways. returns the list without the last element 
-- !!, take, drop, length, sum, product, ++, reverse

module Exercises where
import Prelude hiding (init, last)
xs = [2..10]

--1. Find errors
n = a `div` length xs
  where
    a = 10
    xs = [1..5]

-- last
last xs = drop (length xs - 1) xs
last' xs = take 1 (reverse xs)

--init
init xs = take (length xs -1) xs
init' xs = reverse $ drop 1 $ reverse xs

-- safetail
safetail :: [a] -> [a]
safetail [] = []
safetail (_:xs) = xs

safetailGuards :: [a] -> [a]
safetailGuards xs
  |null xs = []
  |otherwise = tail xs

safetailCond :: [a] -> [a]
safetailCond xs = if null xs then [] else tail xs


-- OR
myOr :: Bool -> Bool -> Bool
myOr False b = b
myOr True _ = True

-- concat
concat :: [[a]] -> [a]
concat xss = [x | xs <- xss, x <- xs]

--factors
factors :: Int -> [Int]
factors n = [x | x <- [1..n], n `mod` x == 0 ]

--prime
prime :: Int -> Bool
prime n = factors n == [1,n]

--primes: return all primes up untill limit
primes :: Int -> [Int]
primes n = [x | x <- [2..n], prime x]

--7. List comprehensions
-- pythagoreans. 
pyths :: Int -> [(Int,Int,Int)]
pyths n = [(x,y,z)|x<-[1..n], y <- [1..n], z <-[1..n], x^2+y^2 == z^2 ]

--perfect numbers 
perfects :: Int -> [Int]
perfects n = [x | x <- [1..n], x ==sum ( init $ factors x)]

--scalar product: sum of the products of corresponding values in two vectors.
ys = [1..9]
dotProduct :: Num a => [a] -> [a] -> a
dotProduct xs ys = sum [x*y | (x,y) <- zip xs ys]

--8. Recursion @33:30
--and
myAnd :: [Bool] -> Bool
myAnd [] = True
myAnd (x:xs) = x && myAnd xs

--concat
myConcat :: [[a]] -> [a]
myConcat [] = []
--myConcat (x:xs) = x ++ myConcat xs
myConcat x = foldr (++) [] x
--replicate: produce a list with n identical elements
myReplicate :: Int -> a -> [a]
myReplicate 1 a = [a]
myReplicate n a = a : myReplicate (n-1) a 
--(!!)
sel :: [a] -> Int -> a
sel x 0 = head x
sel x n = sel (tail x) (n-1)
--elem: is the value in the list?
myElem :: Eq a => a -> [a] -> Bool
myElem v [] = False
myElem v (x:xs) = (x == v) || myElem v xs 
--merge: two sorted lists and sorts them
--mergesort
--
