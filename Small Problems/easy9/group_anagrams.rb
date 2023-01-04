def anagram_groups(words)
  groups = Hash.new([])
  words.each do |word|
    groups[word.chars.sort] += [word]
  end
  groups.values
end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
anagram_groups(words).each do |group|
  p group
end