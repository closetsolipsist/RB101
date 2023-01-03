greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
# greetings is also mutated since one of its values is, yielding { a : 'hi there'}
puts greetings
