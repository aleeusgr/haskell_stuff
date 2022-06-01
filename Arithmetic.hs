--31. isPrime
prime :: Int -> Bool
prime n = [x | x <- [1..n], n `mod` x == 0 ]  == [1,n]

--32. Greatest Common Divisor
