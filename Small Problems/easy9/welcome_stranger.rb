def greetings(name, profession)
  puts "Hello, #{name.join(' ')}! Nice to have a "\
       "#{profession[:title]} #{profession[:occupation]} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })