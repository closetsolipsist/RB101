def swap_name(name)
  first_name, last_name = name.split(' ')
  "#{last_name}, #{first_name}"
end
p swap_name("Joe Roberts")