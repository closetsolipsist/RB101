def sum_of_sums(nums)
  sum = 0
  repetitions = nums.size
  nums.each do |n|
    sum += n * repetitions
    repetitions -= 1
  end
  sum
end

p sum_of_sums([3, 5, 2]) == 21
p sum_of_sums([1, 5, 7, 3]) == 36
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35