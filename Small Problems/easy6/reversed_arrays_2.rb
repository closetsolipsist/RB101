def my_reverse(arr)
  my_reversed_array = []
  (1..arr.size).to_a.each do |index|
    my_reversed_array << arr[-index]
  end
  my_reversed_array
end

p my_reverse([1,2,3,4]) == [4,3,2,1]
p my_reverse(%w(a b e d c)) == %w(c d e b a)
p my_reverse(['abc']) == ['abc']
p my_reverse([]) == []

list = [1, 3, 2]
new_list = my_reverse(list)
list.object_id != new_list.object_id
list == [1, 3, 2]
new_list == [2, 3, 1]