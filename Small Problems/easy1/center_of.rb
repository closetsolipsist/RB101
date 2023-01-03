def center_of(str)
  chars = str.chars
  while chars.size > 2
    chars.shift
    chars.pop
  end
  chars.join
end

puts center_of('I love ruby') == 'e'
puts center_of('Launch School') == ' '
puts center_of('Launch') == 'un'
puts center_of('Launchschool') == 'hs'
puts center_of('x') == 'x'