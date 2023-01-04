def digit_sum(num)
  num.to_s.chars.map(&:to_i).sum
end

puts digit_sum(23) == 5
puts digit_sum(496) == 19
puts digit_sum(123_456_789) == 45