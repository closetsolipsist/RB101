def buy_fruit(quantities)
  fruits_with_repetitions = []
  quantities.each do |fruit, quantity|
    fruits_with_repetitions.concat([fruit] * quantity)
  end
  fruits_with_repetitions
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
["apples", "apples", "apples", "orange", "bananas", "bananas"]
