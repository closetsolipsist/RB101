def crunch(str)
  crunched_chars = []
  str.chars.each do |char|
    if char != crunched_chars[-1]
      crunched_chars << char
    end
  end
  crunched_chars.join
end

p crunch('ddaaiillly dddddooouubbbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('gggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''