def find_fibonacci_index_by_length(desired_length)
  return 1 if desired_length == 1
  a = 1
  b = 1
  index = 2
  while b.to_s.size < desired_length
    a, b = b, a + b
    index += 1
  end
  index
end

p find_fibonacci_index_by_length(2) == 7
p find_fibonacci_index_by_length(3) == 12
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847