def leading_substrings(str)
  leading_substrings = []
  (0...str.size).to_a.each do |n|
    leading_substrings << str[0..n]
  end
  leading_substrings
end

def substrings(str)
  substrings = []
  chars = str.chars
  while !chars.empty?
    substrings.concat(leading_substrings(chars.join))
    chars.shift
  end
  substrings
end

def palindromes(str)
  substrings(str).select { |str| str.size > 1 && str == str.reverse }
end

p palindromes('abcd')
p palindromes('madam')
p palindromes('hello-madam-did-madam-goodbye')
p palindromes('knitting cassettes')