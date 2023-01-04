arr = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]
updated_array = arr.map do |sub_arr|
  sub_arr.select { |elem| elem % 3 == 0 }
end
p updated_array