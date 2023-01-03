def negative(n)
  if n > 0
    -n
  else
    n
  end
end

puts negative(5) == -5
puts negative(-3) == -3
puts negative(0) == 0 