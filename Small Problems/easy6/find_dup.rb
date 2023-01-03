def find_dup(arr)
  (0...arr.size).each do |index|
    if arr[0...index].include?(arr[index])
      return arr[index]
    end
  end
end

p find_dup([1, 5, 3, 1]) == 1