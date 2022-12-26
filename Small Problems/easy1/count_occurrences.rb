def count_occurrences(array)
  number_of_occurrences = Hash.new(0)
  array.each do |item|
    number_of_occurrences[item.downcase] += 1
  end
  number_of_occurrences.each do |k, v|
    puts "#{k} => #{v}"
  end
end
