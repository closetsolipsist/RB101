def as_word(num)
  digit_words = [''] + %w(one two three four five six seven eight nine ten)
  tens_words = %w(_ _ twenty thirty forty fifty sixty seventy eighty ninety)
  tens_place = num / 10
  ones_place = num % 10
  case tens_place
  when 0
    return 'zero' if ones_place == 0
    digit_words[ones_place]
  when 1
    %w(ten eleven twelve thirteen fourteen fifteen sixteen
       seventeen eighteen nineteen)[ones_place]
  else
    tens_words[tens_place] + ' ' + digit_words[ones_place]
  end
end

def alphabetic_number_sort(nums)
  #nums.sort { |num1, num2| as_word(num1) <=> as_word(num2) } # from Further Exploration
  nums.sort_by { |num| as_word(num) }
end

p alphabetic_number_sort((0..19).to_a) == [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7,
                                          17, 6, 16, 10, 13, 3, 12, 2, 0]