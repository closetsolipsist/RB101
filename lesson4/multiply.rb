def multiply(nums, value_to_multiply_by)
  modified_nums = []
  index = 0
  loop do
    break if index == nums.size
    modified_nums << nums[index] * value_to_multiply_by
    index += 1
  end
  modified_nums
end

my_array = [1, 2, 3, 4]
p multiply(my_array, 4)