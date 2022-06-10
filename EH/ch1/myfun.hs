doubleMe x = 3*x

doubleUs x y = doubleMe x + doubleMe y

doubleSmallNumber x = if x > 100  
                        then x  
                        else x*2

boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]

rightTriangles = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2, a+b+c==24 ]

factorial' :: Integer -> Integer  
factorial' n = product [1..n]  

--pattern matching
fib :: (Integral a) => a -> Int
fib 0 = 0
fib 1 = 1
fib x = fib (x-1) + fib (x-2) 

factorial :: (Integral a) => a -> a  
factorial 0 = 1  
factorial n = n * factorial (n - 1)

addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)  
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

--guards: write something

max' :: (Ord a) => a -> a -> a  
max' a b   
  | a > b     = a  
  | otherwise = b  
