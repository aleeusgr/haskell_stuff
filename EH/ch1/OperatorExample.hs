module OperatorExample where
infixl 6 +++
a +++ b = a + b

increment = (+++ 1)

infixr 9 `divide`
divide = (/)
