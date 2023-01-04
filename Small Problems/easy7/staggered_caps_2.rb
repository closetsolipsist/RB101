def staggered_case(str, toggle_on_non_alphabetic = false)
  index = 0
  staggered_chars = []
  str.chars.each do |char|
    if ('a'..'z').cover?(char.downcase) || toggle_on_non_alphabetic
      if index.even?
        staggered_chars << char.upcase
      else
        staggered_chars << char.downcase
      end
      index += 1
    else
      staggered_chars << char
    end
  end
  staggered_chars.join
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'