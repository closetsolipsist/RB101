puts "Enter the first number:"
num1 = gets.chomp.to_i
puts "Enter the second number:"
num2 = nil
loop do
  num2 = gets.chomp.to_i
  if num2 == 0
    puts "Second number cannot by zero, try again"
  else
    break
  end
end
puts "#{num1} + #{num2} = #{num1 + num2}"
puts "#{num1} - #{num2} = #{num1 - num2}"
puts "#{num1} * #{num2} = #{num1 * num2}"
puts "#{num1} / #{num2} = #{num1 / num2}"
puts "#{num1} % #{num2} = #{num1 % num2}"
puts "#{num1} ** #{num2} = #{num1 ** num2}"