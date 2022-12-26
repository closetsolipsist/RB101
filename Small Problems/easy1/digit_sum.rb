def digit_sum(n)
  (n.to_s.split('').map {|s| s.to_i}).sum
end
