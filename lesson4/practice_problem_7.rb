statement = "The Flintstones Rock"
def is_letter(char)
  ('a'..'z').include?(char) || ('A'..'Z').include?(char)
end
unique_letters = statement.chars.uniq.select {|char| is_letter(char)}
letter_counts = unique_letters.map {|char| [char, statement.count(char)]}
p letter_counts.to_h