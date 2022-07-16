-- Week1
-- Types 
type Position = (Int, Int)
origin :: Position
origin = (0,0)

shift :: Position ->Int -> Int -> Position
shift (x,y) a b = (x+a, y+b)
data Shape = Circle Float | Rect Float Float

area :: Shape -> Float
area (Circle r) = pi * r^2
area (Rect x y) = x * y
-- Palindromes
isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome xs = xs == reverse xs

isPalindrome'' :: (Eq a) => [a] -> Bool
isPalindrome'' xs = foldl (\acc (a,b) ->  (a == b) && acc) True input
  where
  input = zip xs (reverse xs)
-- Records
data Figure = Figure { name :: String  
                     , kind :: Shape
                     , location :: Position  
                     
                     }-- deriving (Show)

c = Figure {name="circle1", kind= Circle 5, location=origin}

-- Week2
-- reverse an integer
i = 123456

--revInt :: Int -> Int
  
  

-- Maybe?
-- http://book.realworldhaskell.org/read/data-structures.html
al = [(1, "one"), (2, "two"), (3, "three"), (4, "four")]
myLookup :: Eq a => a -> [(a, b)] -> Maybe b
myLookup _ [] = Nothing
myLookup key ((thiskey,thisval):rest) =
    if key == thiskey
       then Just thisval
       else myLookup key rest

-- week_
-- word numbers
word = "coffee"
wordNumber :: (Num a, Enum a) => [Char] -> Maybe a
wordNumber word = sumMaybe [myLookup x lns| x <- word]
  where 
    lns = zip ['a'..'z'] [1..]
    sumMaybe :: Num a => [Maybe a] -> Maybe a
    sumMaybe = fmap sum . sequence

-- use filter and map.

--week 5 
-- Pure vs IO
-- filter vs fold
-- recursion
fibs = 0 : 1 : zipWith (+) fibs (tail fibs)
fibs' = map fst $ iterate (\(a,b) -> (b,a+b)) (0,1)

fib = (map fib' [0 ..] !!)
    where
      fib' 0 = 0
      fib' 1 = 1
      fib' n = fib (n - 1) + fib (n - 2)


