def multiply_lists(nums1, nums2)
  products = []
  (0...nums1.size).to_a.each do |index|
    products << nums1[index] * nums2[index]
  end
  products
end

p multiply_lists([3, 5, 7], [9, 10, 11]) == [27, 50, 77]