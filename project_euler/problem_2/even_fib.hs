fib :: Int -> Int
fib 0 = 1
fib 1 = 1
fib x = fib (x-1) + fib (x - 2)

-- surely the worst way to do this
tooBig = head [ x | x <- [0..], fib x > 4000000]
fibs = [ fib n | n <- [0..] ]

evenSum = sum [ fibs !! n | n <- [0..tooBig], even (fibs !! n) ]

main =  do
	print evenSum
