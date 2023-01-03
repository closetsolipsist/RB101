def multisum(upper_limit)
  total = 0
  (1..upper_limit).each do |n|
    total += n if n % 3 == 0 || n % 5 == 0
  end
  total
end

p ((1..1000).reduce(0) {|acc, val| val % 3 == 0 || val % 5 == 0 ? acc + val : acc })

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168