def rotate_array(arr)
  arr[1..] + [arr.first]
end

def rotate_rightmost_digits(num, digits)
  digit_chars = num.to_s.chars
  total_digits = digit_chars.size
  after_rotation = digit_chars[0, total_digits - digits] \
    + rotate_array(digit_chars[total_digits - digits, digits])
  after_rotation.join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917