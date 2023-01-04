HEX_DIGITS = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f)
def new_uuid
  [8, 4, 4, 12].map do |length|
    section = ""
    (1..length).to_a.each do |_|
      section << HEX_DIGITS.sample
    end
    section
  end.join('-')
end
p new_uuid