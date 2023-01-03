def titleize(str)
  words = str.split(' ')
  capitalized_words = words.map {|word| word.capitalize}
  capitalized_words.join(' ')
end

words = "the flintstones rock"
p titleize(words)