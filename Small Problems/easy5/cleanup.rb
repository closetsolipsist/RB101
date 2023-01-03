def alphabetic?(c)
  return false if c.size > 1
  ('a'..'z').cover?(c.downcase)
end

def cleanup(str)
  cleaned_chars = []
  str.chars.each do |char|
    if alphabetic?(char)
      cleaned_chars << char
    else
      cleaned_chars << ' 'if cleaned_chars[-1] != ' '
    end
  end
  cleaned_chars.join
end

p cleanup("---what's my +*& line?") == ' what s my line '