def halvsies(arr)
  first_half = []
  second_half = []
  max_first_half_index = (arr.size - 1) / 2
  min_second_half_index = (arr.size + 1) / 2
  (0..max_first_half_index).to_a.each do |n|
    first_half << arr[n]
    second_half << arr[min_second_half_index + n]
  end
  if arr.size.odd?
    second_half.pop
  end
  [first_half, second_half]
end

def halvsies_alt(arr)
  max_first_half_index = (arr.size - 1) / 2
  second_half = Array.new(arr)
  first_half = second_half.slice!(0..max_first_half_index)
  [first_half, second_half]
end

p halvsies_alt([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies_alt([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies_alt([5]) == [[5], []]
p halvsies_alt([]) == [[], []]