def diamond(longest_row_length)
  row_length = 1
  space_length = (longest_row_length - 1) / 2
  lines = []
  while row_length <= longest_row_length
    lines << ' ' * space_length + '*' * row_length + ' ' * space_length
    row_length += 2
    space_length -= 1
  end
  lines.concat(lines[0..-2].reverse)
  puts lines.join("\n")
end

def diamond_outline(longest_row_length)
  row_length = 1
  space_length = (longest_row_length - 1) / 2
  lines = []
  while row_length <= longest_row_length
    if row_length == 1
      lines << ' ' * space_length + '*' + ' ' * space_length
    else
      lines << ' ' * space_length + '*' + ' ' * (row_length - 2) + '*' \
      + ' ' * space_length
    end
    row_length += 2
    space_length -= 1
  end
  lines.concat(lines[0..-2].reverse)
  puts lines.join("\n")
end
diamond(1)
diamond(3)
diamond(9)
diamond_outline(9)