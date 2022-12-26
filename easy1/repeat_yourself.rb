def repeat(str, num)
  i = 0
  while(i < num)
    puts str
    i += 1
  end
end

def repeat2(str, num)
  num.times {puts str}
end

repeat('Hello', 3)
repeat2('Hello', 3)
