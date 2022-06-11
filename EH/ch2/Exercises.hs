-- revert a list with foldr, foldl
-- fold is a pattern of primitive recursion. Function is applied in recursive case, and the argument is what it returns in the base case.
-- https://en.wikipedia.org/wiki/Primitive_recursive_function
x = [1..10]
-- https://stackoverflow.com/questions/1757740/how-does-foldr-work
-- [1,2,3,4,5] => 1:(2:(3:(4:(5:[]))))
--
-- https://stackoverflow.com/questions/26017352/why-can-you-reverse-list-with-foldl-but-not-with-foldr-in-haskell
--
-- foldl :: (t -> a -> t) -> t -> [a] -> t
-- foldl g t []       = t
-- foldl g t (a : as) = foldl g (g t a) as
revFoldl :: [a] -> [a]
revFoldl  = foldl (flip (:)) []  --cheating?

-- foldr f s [1, 2, 3] = f 1 . f 2 . f 3 . id $ s
--revFoldr :: [a] -> [a]


-- Implement the zipWith function with and without using list comprehensions.
-- Can you implement zipWith using foldl?

-- Try implementing concatMap using foldl and foldr. Which one is better? Why?

-- Try to work manually through calling foldl on an infinite list What happens? 
-- What does this tell you about why you can’t use foldl on an infinite list?
-- Are there any other benefits to foldr when dealing with large but finite lists?
