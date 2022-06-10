countdown n =
  if n <= 0 then []
  else n : countdown (n - 1)

-- this functions seeks to factor a number in smallest factors.
-- base recursion case is 1
-- in other cases, if the number can be divided cleanly (?) then it returs the factos as the head, and tries to do the same with the remaining part. If it does not split cleanly, it increments the factor by one.
factors num =
  factors' num 2
    where
      factors' num fact
        | num == 1 = []
        | (num `rem` fact) == 0 = fact : factors' (num `div` fact) fact
        | otherwise = factors' num (fact + 1)

isBalanced s =
  0 == isBalanced' 0 s
    where
      isBalanced' count s
        | null s = count
        | head s == '(' = isBalanced' (count + 1) (tail s)
        | head s == ')' = isBalanced' (count - 1) (tail s)
        | otherwise = isBalanced' count (tail s)

-- shape of a recursive list reduction
reduce func carryValue lst =
  if null lst then carryValue
  else
    let intermediateValue = func carryValue (head lst)
    in reduce func intermediateValue (tail lst)

-- check parenthesis balance using reduce function
--               Boolean 
isBalancedR str = 0 == reduce checkBalance 0 str
  where
    checkBalance count letter
      | letter == '(' = count + 1
      | letter == ')' = count - 1
      | otherwise = count


