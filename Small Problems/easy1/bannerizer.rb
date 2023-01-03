TERMINAL_WIDTH = 80

def lines(str, max_width)
  lines = []
  while str.length > max_width
    lines << str.slice!(0..(max_width - 1))
  end
  lines << str
  lines
end

def print_in_box(str)
  max_possible_line_width = TERMINAL_WIDTH - '| '.size - ' |'.size
  lines = lines(str, max_possible_line_width)
  line_width = (lines.map &:length).max
  lines[lines.size - 1] = lines[lines.size - 1].ljust(line_width)

  horizontal_rule = '+' + '-' * (line_width + 2) + '+'
  empty_line = '|' + ' ' * (line_width + 2) + '|'

  puts horizontal_rule
  puts empty_line
  lines.each { |line| puts '| ' + line + ' |' }
  puts empty_line
  puts horizontal_rule
end
print_in_box('To boldly go where no one has gone before and then go a little further blahlas fkjdn kjfnk jnkjankjan kjfnskdjns k jankjn kjan kajn')
print_in_box('')
