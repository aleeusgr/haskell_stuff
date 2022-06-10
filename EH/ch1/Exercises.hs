-- factorials

factorial' x
  |x<=1 = 1
  |x==1 = 1
  |otherwise = x * factorial' (x-1)

-- better way
-- how this actually is getting parsed?
-- take 10 [4..] 
-- (*) [4..] (tail factorial)
-- tail returns everything except the first
-- zipWith (+) [1, 2, 3] [4, 5, 6] ; applies function to two lists.
factorial = first : step : zipWith (*) [first..] (tail factorial)
  where first = 1
        step = 1
-- how to make it with callable parameters?

-- \take 10 $ factorial

fibonacci x
  --slow, how to make it faster? Use list comprehension?
  |x == 0 = 0
  |x == 1 = 1
  |otherwise = fibonacci(x-1) + fibonacci(x-2)


--Currying. f x y = g (x,y) g is curried, f is uncurried.

