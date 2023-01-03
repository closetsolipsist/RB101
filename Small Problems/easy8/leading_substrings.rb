def leading_substrings(str)
  leading_substrings = []
  (0...str.size).to_a.each do |n|
    leading_substrings << str[0..n]
  end
  leading_substrings
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']