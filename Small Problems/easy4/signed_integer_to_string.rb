DIGIT_CHAR = {
              0 => '0', 1 => '1', 2 => '2', 3 => '3',
              4 => '4', 5 => '5', 6 => '6', 7 => '7',
              8 => '8', 9 => '9'
            }

def signed_integer_to_string(int)
  if int > 0
    '+' + (integer_to_string int)
  elsif int < 0
    '-' + (integer_to_string -int)
  elsif int == 0
    '0'
  end
end

def refactored_signed_integer_to_string(number)
  str_without_sign = integer_to_string(number.abs)
  case number <=> 0
  when -1 then "-" + str_without_sign
  when +1 then "+" + str_without_sign
  else               str_without_sign
  end
end


def integer_to_string(int)
  return '0' if int == 0
  chars = []
  while int > 0
    chars.unshift(DIGIT_CHAR[int % 10])
    int /= 10
  end
  chars.join
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
p refactored_signed_integer_to_string(4321) == '+4321'
p refactored_signed_integer_to_string(-123) == '-123'
p refactored_signed_integer_to_string(0) == '0'