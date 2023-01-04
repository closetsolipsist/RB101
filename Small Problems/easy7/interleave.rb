def interleave(arr1, arr2)
  index = 0
  interleaved_array = []
  while index < arr1.size
    interleaved_array << arr1[index]
    interleaved_array << arr2[index]
    index += 1
  end
  interleaved_array
end

def interleave_alt(arr1, arr2)
  arr1.zip(arr2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
p interleave_alt([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']