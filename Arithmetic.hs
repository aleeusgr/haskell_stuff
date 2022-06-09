--31. isPrime
prime :: Int -> Bool
prime n = [x | x <- [1..n], n `mod` x == 0 ]  == [1,n]

--32. Greatest Common Divisor
gcd' :: Integral a => a -> a -> a
gcd' x y = last [xs | xs <- [1..x], x `rem` xs == 0, ys <- [1..y],  y `rem` ys == 0, xs==ys]
--best 
myGCD :: Integer -> Integer -> Integer
myGCD a b
      | b == 0     = abs a
      | otherwise  = myGCD b (a `mod` b)

--33. Coprimes
coprime :: Integer -> Integer -> Bool
coprime x y = myGCD x y == 1
