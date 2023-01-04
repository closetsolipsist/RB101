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

p max_rotation(735291)