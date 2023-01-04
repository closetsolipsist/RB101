def repeater(str)
  doubled_chars = []
  str.chars.each do |char|
    doubled_chars.concat([char, char])
  end
  doubled_chars.join
end

def repeater_alt(str)
  chars = str.chars
  chars.zip(chars).flatten.join
end

p repeater('Hello') == "HHeelllloo"
p repeater_alt('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''