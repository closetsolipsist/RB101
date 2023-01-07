def fibonacci(n)
  if n == 1 || n == 2 then 1
  else
    fibonacci(n - 2) + fibonacci(n - 1)
  end
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765