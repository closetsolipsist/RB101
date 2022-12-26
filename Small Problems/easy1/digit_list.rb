def digit_list(n)
  n.to_s.split('').map {|s| s.to_i}
end
