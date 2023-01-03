def repeater(str)
  doubled_chars = []
  str.chars.each do |char|
    doubled_chars.concat([char, char])
  end
  doubled_chars.join
end
p repeater('Hello')
p repeater('Good job!')
p repeater('')