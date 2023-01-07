def block_word?(word)
  blocks = []
  ('a'..'m').to_a.each do |letter|
    other_letter = (letter.ord + 13).chr
    blocks << [letter, other_letter]
  end
  letters = word.downcase.chars.select { |char| ('a'..'z').cover?(char) }
  return false if letters.uniq.size < letters.size
  blocks.each do |block|
    if letters.include?(block[0]) && letters.include?(block[1])
      return false
    end
  end
  true
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
p block_word?('bib') == false