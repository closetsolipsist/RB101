puts ">> What name would you like?"
name = gets.chomp
if name.empty?
  name = "Teddy"
end
puts "#{name} is #{20 + rand(181)} years old!"
