def shout_out_to(name)
  # We modify the array resulting from String#chars, but this doesn't
  # affect the original string.
  #name.chars each { |c| c.upcase! }
  puts 'HEY ' + name.upcase
end
shout_out_to('you')