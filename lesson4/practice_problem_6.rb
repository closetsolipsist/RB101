flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.each {|name| name.slice!(3..)}
p flintstones