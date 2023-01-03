def count_occurrences(arr)
  occurrences = Hash.new(0)
  arr.each do |item|
    occurrences[item] += 1
  end
  occurrences.each do |item, number|
    puts "#{item} => #{number}"
  end
end
vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]
count_occurrences(vehicles)