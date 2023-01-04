def include?(arr, value)
  arr.each do |item|
    if item == value
      return true
    end
  end
  false
end

def include_alt?(arr, value)
  arr.any? { |elem| elem == value}
end

p include?([1,2,3,4,5],3) == true
p include?([1,2,3,4,5],6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false