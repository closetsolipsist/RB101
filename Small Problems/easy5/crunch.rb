def crunch(str)
  crunched_chars = []
  str.chars.each do |char|
    if char != crunched_chars[-1]
      crunched_chars << char
    end
  end
  crunched_chars.join
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''