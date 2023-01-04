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
  substrings(str).select { |substr| substr.size > 1 && substr == substr.reverse }
end

def palindromes_just_alphanumeric_ignoring_case(str)
  substrings(str).select do |substr|
    alphanumeric_part = substr.chars.select { |char| char =~ /[a-zA-Z0-9]/ }.join
    alphanumeric_part.downcase!
    alphanumeric_part.size > 1 && alphanumeric_part == alphanumeric_part.reverse
  end
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

p palindromes_just_alphanumeric_ignoring_case('hello-madam-did-madam-goodbye')