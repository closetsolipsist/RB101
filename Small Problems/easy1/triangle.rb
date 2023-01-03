def reflect_vertically(lines)
  lines.reverse
end

def reflect_horizontally(lines)
  lines.map(&:reverse)
end

def remove_trailing_spaces(line)
  chars = line.chars
  while chars.last == ' '
    chars.pop
  end
  chars.join
end

def triangle(side_length, corner)
  rows = []
  (1..side_length).each do |num_stars|
    row = ('*' * num_stars).rjust(side_length)
    rows << row
  end
  adjusted_rows = case corner
                  when "bottom-right"
                    rows
                  when "top-right"
                    reflect_vertically(rows)
                  when "bottom-left"
                    reflect_horizontally(rows)
                  when "top-left"
                    reflect_horizontally(reflect_vertically(rows))
                  end
  adjusted_rows.each { |row| puts remove_trailing_spaces(row) }
end

triangle(5, "bottom-left")
triangle(9, "bottom-right")
