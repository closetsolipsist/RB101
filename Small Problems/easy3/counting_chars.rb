print "Please write a word or multiple words: "
response = gets.chomp
puts "There are #{response.delete(" ").length} characters in \"#{response}\""