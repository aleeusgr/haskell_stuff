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
