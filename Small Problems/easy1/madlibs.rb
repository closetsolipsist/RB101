def ask_for(str)
  print "Enter a #{str}: "
  answer = nil
  loop do
    answer = gets.chomp
    if answer.empty?
      puts "Invalid response, try again."
    else
      break
    end
  end
  answer
end

categories = ["noun", "verb", "adverb", "adjective"]
responses = {}
categories.each do |category|
  responses[category] = ask_for(category)
end

madlib = "Do you #{responses['verb']} your #{responses['adjective']} " \
         "#{responses['noun']} #{responses['adverb']}. That's hilarious!"
puts madlib