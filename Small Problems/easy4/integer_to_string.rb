DIGIT_CHAR = {
              0 => '0', 1 => '1', 2 => '2', 3 => '3',
              4 => '4', 5 => '5', 6 => '6', 7 => '7',
              8 => '8', 9 => '9'
            }
def integer_to_string(int)
  return '0' if int == 0
  chars = []
  while int > 0
    chars.unshift(DIGIT_CHAR[int % 10])
    int /= 10
  end
  chars.join
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'