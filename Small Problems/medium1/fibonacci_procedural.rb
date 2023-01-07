def fibonacci(index)
  return 1 if index == 1
  a = 1
  b = 1
  current_index = 2
  while current_index < index
    a, b = b, a + b
    current_index += 1
  end
  b
end

p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501