def staggered_case(str, capitalize_first = true)
  index = 0
  index += 1 if capitalize_first == false
  staggered_chars = []
  str.chars.each do |char|
    if index.even?
      staggered_chars << char.upcase
    else
      staggered_chars << char.downcase
    end
    index += 1
  end
  staggered_chars.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'