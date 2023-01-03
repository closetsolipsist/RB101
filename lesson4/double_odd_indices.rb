def double_odd_indices(nums)
  modified_nums = []
  index = 0
  loop do
    break if index == nums.size
    if index.odd?
      modified_nums << nums[index] * 2
    else
      modified_nums << nums[index]
    end
  index += 1
  end
  modified_nums
end

p double_odd_indices [1, 2, 3, 4]