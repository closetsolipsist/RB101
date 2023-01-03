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

def hexadecimal_to_integer(str)
  hex_chars = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f)
  str = str.downcase.chars.map {|char| hex_chars.index(char)}
  resulting_integer = 0
  while !str.empty?
    resulting_integer *= 16
    resulting_integer += str.shift
  end
  resulting_integer
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
p hexadecimal_to_integer('4D9f') == 19871