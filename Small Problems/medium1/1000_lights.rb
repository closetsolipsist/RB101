def joinor(arr, separator = ', ', final_separator = 'or')
  arr = arr.map(&:to_s)
  if arr.size == 0
    'none'
  elsif arr.size == 1
    arr[0]
  elsif arr.size == 2
    arr[0] + " #{final_separator} " + arr[1]
  else
    arr[-1] = "#{final_separator} #{arr[-1]}"
    arr.join(separator)
  end
end

def lights_left_on(number_of_switches)
  switches = [false] * (number_of_switches + 1)
  (1..number_of_switches).to_a.each do |increment|
    index = increment
    while index <= number_of_switches
      switches[index] = switches[index] ? false : true
      index += increment
    end
    on_lights = (1..number_of_switches).to_a.select { |index| switches[index] }
    off_lights = (1..number_of_switches).to_a.select { |index| !switches[index] }
    puts "Off: #{joinor(off_lights, ', ', 'and')}; On: #{joinor(on_lights, ', ', 'and')}"
  end
  (1..number_of_switches).to_a.select { |index| switches[index] }
end
p lights_left_on(5) == [1, 4]
#p lights_left_on(10) == [1, 4, 9]
#p lights_left_on(1000)