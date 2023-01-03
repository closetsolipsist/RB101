def ordinalize(n)
  if n % 10 == 1 && n % 100 != 11
    n.to_s + "st"
  elsif n % 10 == 2 && n % 100 != 12
    n.to_s + "nd"
  elsif n % 10 == 3 && n % 100 != 13
    n.to_s + "rd"
  else
    n.to_s + "th"
  end
end

def century(year)
  ordinalize(((year - 1) / 100) + 1)
end

p century(2000) == '20th'
p century(1999) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'