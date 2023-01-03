def halvsies(arr)
  first_half = []
  second_half = []
  max_first_half_index = arr.size / 2
  (0..arr.size / 2).to_a.each do |index|
    first_half << arr[index]
  end
  end