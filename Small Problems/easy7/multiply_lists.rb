def multiply_lists(nums1, nums2)
  products = []
  (0...nums1.size).to_a.each do |index|
    products << nums1[index] * nums2[index]
  end
  products
end

def multiply_lists_alt(nums1, nums2)
  nums1.zip(nums2).map { |a, b| a * b }
end

p multiply_lists([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
p multiply_lists_alt([3, 5, 7], [9, 10, 11]) == [27, 50, 77]