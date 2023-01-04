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

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
