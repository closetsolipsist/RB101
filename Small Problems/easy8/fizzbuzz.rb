def fizzbuzz(start_num, end_num)
  start_num.upto(end_num) do |num|
    print "Fizz" if num % 3 == 0
    print "Buzz" if num % 5 == 0
    print num if num % 3 != 0 && num % 5 != 0
    print ', ' unless num == end_num
  end
  puts
end

fizzbuzz(1, 15)