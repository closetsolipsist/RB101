def merge(arr1, arr2)
  merged_array = Array.new(arr1)
  arr2.each do |elem|
    merged_array << elem unless arr1.include?(elem)
  end
  merged_array
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]