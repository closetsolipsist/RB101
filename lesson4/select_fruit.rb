produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(produce)
  selected_items = {}
  index = 0
  loop do
    break if index == produce.keys.size
    current_item = produce.keys[index]
    if produce[current_item] == 'Fruit'
      selected_items[current_item] = produce[current_item]
    end
    index += 1
  end
  selected_items
end

puts select_fruit(produce)