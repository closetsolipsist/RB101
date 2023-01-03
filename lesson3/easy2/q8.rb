advice = "Few things in life are as important as house training your pet dinosaur."
puts advice.slice!(/Few.*as /)
puts advice

advice = "Few things in life are as important as house training your pet dinosaur."
puts advice.slice(/Few.*as /) # returns the same as above but advice is not modified