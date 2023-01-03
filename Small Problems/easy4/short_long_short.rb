def short_long_short(str1, str2)
  if str1.length < str2.length
    shorter = str1
    longer = str2
  else
    shorter = str2
    longer = str1
  end
  shorter + longer + shorter
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"