def fibonacci_last(index)
  return 1 if index == 1
  a = 1
  b = 1
  current_index = 2
  while current_index < index
    a, b = b, (a + b) % 10
    current_index += 1
  end
  b
end

def fibonacci_last_alt(index)
  complete_cycle = (1..60).to_a.map { |n| fibonacci_last(n) }
  complete_cycle[(index - 1) % 60]
end


p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
#p fibonacci_last(123456789) # -> 4
p fibonacci_last_alt(123_456_789_987_745)