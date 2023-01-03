def alphabetic?(c)
  return false if c.size > 1
  ('a'..'z').cover?(c.downcase)
end

def letter_case_count(str)
  case_counts = {lowercase: 0, uppercase: 0, neither: 0}
  str.chars.each do |char|
    if !alphabetic?(char)
      case_counts[:neither] += 1
    elsif char == char.downcase
      case_counts[:lowercase] += 1
    elsif char == char.upcase
      case_counts[:uppercase] += 1
    end
  end
  case_counts
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }