def rotate_array(arr)
  arr[1..] + [arr.first]
end

p rotate_array([7, 3, 5, 2, 9, 1])