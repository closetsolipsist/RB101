def penultimate(str)
  (str.split)[-2]
end

=begin
Edge cases:
- Even number of words: no unique middle, so return both middle words separated by space
- One word: should just return that word
- Empty string: has no middle words, so return nil
=end
def middle_word(str)
  words = str.split(' ')
  return nil if words.size == 0
  if words.size.odd?
    words[words.size / 2]
  else
    words[words.size / 2 - 1, 2].join(' ')
  end
end

p penultimate('last word') == 'last'
p penultimate(' Launch School is great!') == 'is'