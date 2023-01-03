def is_valid_number(str):
  str.to_i.to_s == str
end
puts "Please enter an integer greater than 0:"
number = nil
loop do
  if is_valid_number(number)
    number = number.to_i
    break if number > 0
    puts "Number must be greater than 0."
  else
    puts "Invalid number."
  end
end
puts "Enter 's' to compute the sum, 'p' to compute the product."
choice = gets.chomp
if choice == 's'
  sum = (1..number).to_a.sum
  puts "The sum of the integers between 1 and #{number} is #{sum}."
elsif choice == 'p'
  product = (1..number).to_a.reduce(:*)
  puts "The product of the integers between 1 and #{number} is #{product}."
else
  puts "Invalid choice."
end