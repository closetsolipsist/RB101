=begin
mess_with_it does not mutate answer.
answer and some_number are pointing at the same object with value 42
and then some_number is reassigned to another object with value 42 + 8 = 50
Hence the output is 42 - 8 = 34
=end
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8