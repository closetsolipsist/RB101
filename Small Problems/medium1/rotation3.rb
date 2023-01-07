require 'pry'

def rotate_array(arr)
  return [] if arr.empty?
  arr[1..] + [arr.first]
end

def rotate_rightmost_digits(num, digits)
  digit_chars = num.to_s.chars
  total_digits = digit_chars.size
  after_rotation = digit_chars[0, total_digits - digits] \
    + rotate_array(digit_chars[total_digits - digits, digits])
  after_rotation.join.to_i
end

def max_rotation(num)
  num_length = num.to_s.size
  (0..num_length).to_a.reverse_each do |num_digits|
    num = rotate_rightmost_digits(num, num_digits)
  end
  num
end

def max_rotation_alt(num)
  digits = num.to_s.chars
  num_length = digits.size
  (1..num_length).to_a.reverse_each do |num_to_rotate|
    rotated_part = digits[-(num_to_rotate)..]
    rotated_part = rotated_part[1..] + [rotated_part[0]]
    digits = digits[0, num_length - num_to_rotate] + rotated_part
  end
  digits.join.to_i
end

p max_rotation_alt(735291) == 321579
p max_rotation_alt(3) == 3
p max_rotation_alt(35) == 53
p max_rotation_alt(105) == 15 # the leading zero gets dropped
p max_rotation_alt(8_703_529_146) == 7_321_609_845