require 'pry'
def featured(n)
  multiple_of_seven = 7 * (n / 7) + 7
  multiple_of_seven += 7 unless multiple_of_seven.odd?
  loop do
    digits = multiple_of_seven.to_s.chars
    break if digits.uniq.size == digits.size
    if multiple_of_seven >= 1e10
      return "There is no featured number greater than #{n}."
    end
    multiple_of_seven += 14
  end
  multiple_of_seven
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(9_999_999_999)