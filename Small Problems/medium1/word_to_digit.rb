require 'pry'

def word_to_digit(str)
  digit_words = %w(zero one two three four five six seven eight nine)
  altered_words = str.split.map do |word|
    updated_word = word
    alphanumeric_part = (word.chars.select { |char| char =~ /[a-zA-Z0-9]/ }).join
    digit_words.each do |digit_word|
      if alphanumeric_part == digit_word
        updated_word = word.gsub(digit_word, digit_words.index(digit_word).to_s)
        updated_word.gsub!(digit_word.capitalize, digit_words.index(digit_word).to_s)
        updated_word.gsub!(digit_word.upcase, digit_words.index(digit_word).to_s)
      end
    end
    updated_word
  end
  altered_words.join(' ')
end

def word_to_digit_no_spaces(str)
  digit_words = %w(zero one two three four five six seven eight nine)
  processing_digits = false
  converted_str = ''
  str.split.each do |word|
    alphanumeric_part = (word.chars.select { |char| char =~ /[a-zA-Z0-9]/ }).join
    if digit_words.include?(alphanumeric_part)
      converted_str << ' ' if !processing_digits
      processing_digits = true
      digit_string = digit_words.index(alphanumeric_part).to_s
      converted_str << word.gsub(alphanumeric_part, digit_string)
    else
      processing_digits = false
      converted_str << ' ' + word
    end
  end
  converted_str
end

def format_phone_numbers(str)
  updated_str = ''
  digit_chars = %w(0 1 2 3 4 5 6 7 8 9)
  digits_seen = 0
  str.chars.each do |char|
    updated_str << char
    if digit_chars.include?(char)
      digits_seen += 1
      if digits_seen == 10
        d1,d2,d3,d4,d5,d6,d7,d8,d9,d10 = updated_str[-10..].chars
        updated_str[-10..] = '(' + d1 + d2 + d3 + ') ' + d4 + d5 + \
                             d6 + '-' + d7 + d8 + d9 + d10
        
      end
    else
      digits_seen = 0
    end
  end
  updated_str
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
p word_to_digit_no_spaces('Please call me at five five five one two three four. Thanks.')
p format_phone_numbers("My phone number is 2483748283, and yours is 2819281918")