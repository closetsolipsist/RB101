def double_numbers!(nums)
  index = 0
  loop do
    break if index == nums.size
    nums[index] *= 2
    index += 1
  end
end

my_array = [1, 2, 3, 4]
double_numbers!(my_array)
p my_array