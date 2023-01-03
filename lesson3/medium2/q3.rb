def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

=begin
Inside tricky_method(), a_string_param is just reassigned to
a new object, whereas the object referred to by an_array_param 
is mutated, so my_string will look like
"pumpkins"
and my_array will look like
["pumpkins", "rutabaga"]
=end