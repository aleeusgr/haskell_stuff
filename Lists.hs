--module Main where
x = [1..10]
z = ['a'..'z']

-- 1. last 
myLast x = head $ reverse x

-- 2. but one last
myButLast x = reverse x !! 1

-- 3. K-th element of a list
elementAt x k = last (take k x)  

--best way
elementAt' :: [a] -> Int -> a
elementAt' list i    = list !! (i-1)

-- 4. Number of elements, length
myLength :: [a] -> Int
-- myLength = sum . map (\_->1)
-- proper:
myLength [] = 0
myLength (_:xs) = 1 + myLength xs

--5. reverse a list
myReverse :: [a] -> [a]
myReverse [] = []
myReverse x = last x : myReverse (init x)

--6. palindrome
p = [1,3,1]
isPalindrome :: Eq a => [a] -> Bool
isPalindrome x = x == myReverse x

--7. flatten
data NestedList a = Elem a | List [NestedList a]

--main x = x
