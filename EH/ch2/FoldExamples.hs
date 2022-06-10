module FoldExamples where
import Prelude hiding (foldl, foldr)

foldl func carryValue lst =
  if null lst
  then carryValue
  else foldl func (func carryValue (head lst)) (tail lst)

foldr func carryValue lst =
  if null lst
  then carryValue
  else func (head lst) $ foldr func carryValue (tail lst)

--foldl (+) 0 [1,2,3]
--it decomposes a list into its head and tail, 
--at eachstep it applies applies the function its given to carryValue and the head of the list
--until it gets and empty list, at which point it returns carryValue


--foldr (+) 0 [1,2,3]
--it applies function its given to head of the current list as a fisrt parameter and result of itself on the tail of the list
----well it applies func with one value and $. What does $ do? function application operator
----functionA $ functionB param ~ functionA (functionB param)
--untill it runs out of tail, at which point it returns carryValue
--
 
