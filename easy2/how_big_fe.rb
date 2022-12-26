CM_PER_INCH = 2.54

puts "What is the length of the room in feet? "
length = gets.chomp.to_f
puts "What is the width of the room in feet? "
width = gets.chomp.to_f
area_in_ft = length * width
area_in_in = area_in_ft * 12 * 12
area_in_cm = area_in_in * CM_PER_INCH ** 2
puts "The area of the room is #{area_in_ft} square feet (#{area_in_in} square inches or #{area_in_cm} square cm)"
