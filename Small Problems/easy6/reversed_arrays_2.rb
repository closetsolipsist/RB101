def my_reverse(arr)
  reversed_array = []
  (1..arr.size).to_a.each do |index|
    reversed_array << arr[-index]
  end
  reversed_array
end

def my_reverse_alt(arr)
  arr.each_with_object([]) { |item, reversed_array| reversed_array.unshift(item) }
end

def my_reverse_alt_2(arr)
  arr.inject([]) { |reversed_array, item| reversed_array.unshift(item)}
end

p my_reverse([1,2,3,4]) == [4,3,2,1]
p my_reverse(%w(a b e d c)) == %w(c d e b a)
p my_reverse(['abc']) == ['abc']
p my_reverse([]) == []

list = [1, 3, 2]
new_list = my_reverse(list)
p list.object_id != new_list.object_id
p list == [1, 3, 2]
p new_list == [2, 3, 1]