def string_to_integer(str)
  digit_chars = %w(0 1 2 3 4 5 6 7 8 9)
  str = str.chars
  resulting_integer = 0
  while !str.empty?
    resulting_integer *= 10
    next_digit_char = str.shift
    resulting_integer += digit_chars.index(next_digit_char)
  end
  resulting_integer
end

def string_to_signed_integer(str)
  if str.chr == '+'
    string_to_integer str[1..]
  elsif str.chr == '-'
    -(string_to_integer str[1..])
  else
    string_to_integer str
  end
end

def given_string_to_signed_integer(string)
  if string[0] == '+' || string[0] == '-'
    unsigned_str_part = string[1..]
  else
    unsigned_str_part = string
  end
  unsigned_int_part = string_to_integer(unsigned_str_part)
  string[0] == '-' ? -unsigned_int_part : unsigned_int_part
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100

p given_string_to_signed_integer('4321') == 4321
p given_string_to_signed_integer('-570') == -570
p given_string_to_signed_integer('+100') == 100