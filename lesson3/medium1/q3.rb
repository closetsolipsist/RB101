def factors(number)
  divisor = 1
  factors = []
  while divisor <= number
    # number % divisor == 0 checks if divisor divides number
    factors << divisor if number % divisor == 0
    divisor += 1
  end
  # here we return the array of factors we've mades
  factors
end