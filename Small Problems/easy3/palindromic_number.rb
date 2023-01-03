def palindromic_number?(int)
  int.to_s.reverse == int.to_s
end

# doesn't permit digits bigger than 7, but it's impossible
# in general to make an integer literal with a digit bigger
# than 7 because it's interpreted as an octal number.
def palindromic_number_with_leading_zeros?(int, leading_zeros = 0)
  if leading_zeros > 0
    int_as_str = '0' * leading_zeros + int.to_s(8)
    int_as_str.reverse == int_as_str
  else
    int.to_s.reverse == int.to_s
  end
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true
p palindromic_number_with_leading_zeros?(010, 1) == true
p palindromic_number_with_leading_zeros?(0010, 2) == false
p palindromic_number_with_leading_zeros?(0075700, 2)