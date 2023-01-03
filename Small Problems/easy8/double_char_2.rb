def consonant(char)
  vowels = %w(a e i o u A E I O U)
  ('a'..'z').cover?(char.downcase) && !vowels.include?(char)
end

def double_consonants(str)
  doubled_chars = []
  str.chars.each do |char|
    if consonant(char)
      doubled_chars.concat([char, char])
    else
      doubled_chars << char
    end
  end
  doubled_chars.join
end
p double_consonants('String')
p double_consonants('Hello-World')
p double_consonants('July 4th')
p double_consonants('')