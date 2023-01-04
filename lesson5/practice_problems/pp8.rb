hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], \
       third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
hsh.each_value do |arr|
  arr.each do |str|
    str.each_char do |char|
      print char if char =~ /[aeiouAEIOU]/
    end
  end
end
puts