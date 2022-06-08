-- https://youtube.com/playlist?list=PLF1Z-APd9zK7usPMx3LGMZEHrECUGodd3
-- using functions from FP L4
-- define `last` in two ways. gets the last element of the list
-- define `init` in two ways. returns the list without the last element 
-- !!, take, drop, length, sum, product, ++, reverse

module Exercises where
import Prelude hiding (init, last)
xs = [2..10]

qsort :: Ord a => [a] -> [a]
qsort []     = []
qsort (x:xs) = qsort ys ++ [x] ++ qsort zs
               where 
                    ys = [a | a <- xs, a <= x]
                    zs = [b | b <- xs, b > x ]
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
sel (x:_) 0 = x
sel (_:xs) n = sel xs (n-1)

--elem: is the value in the list?
myElem :: Eq a => a -> [a] -> Bool
myElem v [] = False
myElem v (x:xs) = (x == v) || myElem v xs 

--merge: two sorted lists and sorts them
myMerge :: Ord a => [a] -> [a] -> [a]
myMerge [] y = y
myMerge x [] = x
--myMerge (x:xs) (y:ys) = if x<y then [x,y] ++ myMerge xs ys else [y,x] ++ myMerge xs ys
myMerge (x:xs) (y:ys) = if x<y then x : myMerge xs (y:ys) else y : myMerge (x:xs) ys

--insert
insert :: Ord a => a -> [a] -> [a]
insert a [] = [a]
insert a (x:xs) = if a <= x then a:x:xs else x : insert a xs

--isort
isort :: Ord a => [a] -> [a]
isort [] = [] 
isort (x:xs) = insert x (isort xs)
--mergesort
mSort :: Ord a => [a] -> [a]
mSort [] = []
mSort [x] = [x]
mSort xs = myMerge (mSort ys) (mSort zs)
  where ys = take half xs
        zs = drop half xs
        half = length xs `div` 2
-- Lecture 10 
-- 1.
-- 2. [f x | x <-xs , p x ] using map and filter
-- 3. map and filter using foldr
--myMap :: (a->b) -> [a] -> [b]

-- Lecture 11
mySum :: Num a => [a] -> a
mySum = foldr (+) 0

drop' :: Int  -> [a] -> [a]
drop' _ [] = []
drop' 0 x = x
drop' n (_:xs) = drop' (n-1) xs
-- what happens when n > length x?

init'' :: [a] -> [a] --remove last element from an empty list

init'' (x:xs) | null xs = []
              | otherwise = x:init'' xs
--standard lib definition uses pattern matching, not guards.
