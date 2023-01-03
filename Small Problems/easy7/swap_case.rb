def swap_char_case(char)
  if ('a'..'z').cover?(char)
    ('A'.ord + (char.ord - 'a'.ord)).chr
  elsif ('A'..'Z').cover?(char)
    ('a'.ord + (char.ord - 'A'.ord)).chr
  else
    char
  end
end

def swapcase(str)
  swapped_chars = str.chars.map { |char| swap_char_case(char) }
  swapped_chars.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'