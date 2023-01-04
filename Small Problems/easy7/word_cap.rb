def word_cap(str)
  str.split.map(&:capitalize).join(' ')
end

def my_capitalize(str)
  lowercase_str = str.downcase
  lowercase_str[0].upcase + lowercase_str[1..]
end


def my_capitalize_alt(str)
  chars = str.chars
  first_char = chars.shift
  first_char.upcase + chars.join.downcase
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'