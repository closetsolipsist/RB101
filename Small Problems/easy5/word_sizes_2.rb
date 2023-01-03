def alphabetic?(c)
  return false if c.size > 1
  ('a'..'z').cover?(c.downcase)
end


def word_sizes(str)
  length_counts = Hash.new(0)
  str.split(' ').each do |word|
    letters = word.chars.select { |char| alphabetic?(char) }
    length_counts[letters.size] += 1
  end
  length_counts
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}