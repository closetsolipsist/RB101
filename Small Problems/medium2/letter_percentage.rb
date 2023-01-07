def letter_percentages(str)
  lowercase = str.count('a-z')
  uppercase = str.count('A-Z')
  other = str.size - lowercase - uppercase
  total = str.size.to_f
  { lowercase: (100 * lowercase / total).round(1),
    uppercase: (100 * uppercase / total).round(1),
    neither: (100 * other / total).round(1) }
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
p letter_percentages('abcdefGHI')