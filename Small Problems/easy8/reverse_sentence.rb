def reverse_sentence(str)
  str.split.reverse.join(' ')
end

p reverse_sentence('Hello World')
p reverse_sentence('Reverse these words')
p reverse_sentence('')
p reverse_sentence('     ')