def oddities(nums)
  odd_indexed_values = []
  nums.each_with_index do |value, index|
    odd_indexed_values << value if index.even?
  end
  odd_indexed_values
end

def odds_alt1(nums)
  take_this_one = true
  odd_indexed_values = []
  nums.each do |num|
    odd_indexed_values << num if take_this_one
    take_this_one = !take_this_one
  end
  odd_indexed_values
end

def odds_alt2(nums)
  nums.zip((0...nums.size).to_a)
      .map { |elem, index| index.even? ? [elem] : []}.flatten
end

def evens(num)
  even_indexed_values = []
  num.each_with_index do |value, index|
    even_indexed_values << value if index.odd?
  end
  even_indexed_values
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
p oddities([1, 2, 3, 4, 1]) == [1, 3, 1]