def alphanumeric?(char)
  ('a'..'z').cover?(char) || ('A'..'Z').cover?(char) ||
  ('0'..'9').cover?(char)
end

def real_palindrome?(str)
  chars = str.downcase.chars
  chars = chars.select { |char| alphanumeric?(char)}
  chars == chars.reverse
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false