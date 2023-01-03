def uppercase?(str)
  str == str.upcase
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

=begin
Making uppercase? return true for the empty string makes
sense: otherwise, that string would be the one reason we couldn't
state the given condition as "has no lowercase characters." In
math, this kind of thing is called trivially true: it is trivially
true that all alphabetic characters in the empty string are
uppercase, because we can't find any characters where this fails.
=end