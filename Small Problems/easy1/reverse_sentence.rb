def reverse_sentence(str)
  words = str.split(' ')
  reversed_string = ''
  while words.length > 1
    reversed_string << words.pop
    reversed_string << ' '
  end
  if !words.empty?
    reversed_string << words[0]
  end
  reversed_string
end
