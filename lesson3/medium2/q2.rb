a = 42
b = 42
c = a

puts a.object_id
puts b.object_id
puts c.object_id

# now, they all should have the same object id
# integers are immutable, so integer literals are already
# assigned object ids