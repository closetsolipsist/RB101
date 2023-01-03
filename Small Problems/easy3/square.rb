def multiply(m, n)
  m * n
end

def square(n)
  multiply(n, n)
end

def power(base, exponent)
  result = 1
  (1..exponent).each do
    result = multiply(result, base)
  end
  result
end

p power(2, 10) == 1024