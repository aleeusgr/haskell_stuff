doubleElems :: [Int] -> [Int]
doubleElems nums =
  if null nums
  then []
  else
    let
      hd = head nums
      tl = tail nums
    in (2 * hd) : doubleElems tl
