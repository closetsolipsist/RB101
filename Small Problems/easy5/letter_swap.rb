def swap_outer(word)
  if word.size == 1
    word
  else
    word[-1] + word[1..-2] + word[0]
  end
end

def swap(sentence)
  words = sentence.split(' ')
  words = words.map { |word| swap_outer(word)}
  words.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'