def ordinalize(n)
  if n % 10 == 1 && n % 100 != 11
    n.to_s + "st"
  elsif n % 10 == 2 && n % 100 != 12
    n.to_s + "nd"
  elsif n % 10 == 3 && n % 100 != 13
    n.to_s + "rd"
  else
    n.to_s + "st"
  end
end
numbers = []
(1..5).each do |n|
  puts "==> Enter the #{ordinalize(n)} number:"
  numbers << gets.chomp.to_i
end
puts "Enter the last number:"
last_number = gets.chomp.to_i
if numbers.include?(last_number)
  puts "The number #{last_number} appears in #{numbers}."
else
  puts "The number #{last_number} does not appear in #{numbers}."
end
