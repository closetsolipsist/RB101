def count_occurrences(arr)
  occurrences = Hash.new(0)
  arr.each do |item|
    occurrences[item] += 1
  end
  occurrences.each do |item, number|
    puts "#{item} => #{number}"
  end
end

def count_occurrences_case_insensitive(arr)
  occurrences = Hash.new(0)
  arr.each do |item|
    occurrences[item.downcase] += 1
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
count_occurrences_case_insensitive(['A', 'a', 'b', 'c'])