def stringy(n, starting_bit = 1)
  returned_string = ''
  i = 0
  starting_char = starting_bit.to_s
  other_char = ((starting_bit + 1) % 2).to_s
  while i < n
    if i.even?
      returned_string << starting_char
    else
      returned_string << other_char
    end
    i += 1
  end
  returned_string
end

def stringy2(n, starting_bit = 1)
  if starting_bit == 0
    '01' * (n / 2) + '0' * (n % 2)
  elsif starting_bit == 1
    '10' * (n / 2) + '1' * (n % 2)
  end
end
