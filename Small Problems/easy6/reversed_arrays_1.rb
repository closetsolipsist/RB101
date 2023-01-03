def my_reverse!(arr)
  arr_copy = Array.new(arr)
  index = 0
  while index < arr.size
    arr[index] = arr_copy[-1 - index]
    index += 1
  end
  arr
end

list = [1, 2, 3, 4]
result = my_reverse!(list)
p result == [4, 3, 2, 1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id

list = %w(a b e d c)
p my_reverse!(list) == ["c", "d", "e", "b", "a"]
p list == ["c", "d", "e", "b", "a"]

list = ['abc']
p my_reverse!(list) == ["abc"]
p list == ["abc"]

list = []
p my_reverse!(list) == []
p list == []