def properly_nested?(str, left_char, right_char)
  parentheses = str.chars.select { |char| [left_char, right_char].include?(char) }
  lefts_to_close = 0
  parentheses.each do |parenth|
    if parenth == left_char
      lefts_to_close += 1
    elsif parenth == right_char
      if lefts_to_close == 0
        return false
      else
        lefts_to_close -= 1
      end
    end
  end
  lefts_to_close == 0
end

def balanced(str, char)
  str.count(char).even?
end

def no_mismatches(str)
  properly_nested?(str, '(', ')') &&
  properly_nested?(str, '[', ']') &&
  properly_nested?(str, '{', '}') &&
  balanced(str, "'") &&
  balanced(str, '"')
end

p properly_nested?('What (is) this?', '(', ')') == true
p properly_nested?('What is) this?', '(', ')') == false
p properly_nested?('What (is this?', '(', ')') == false
p properly_nested?('((What) (is this))?', '(', ')') == true
p properly_nested?('((What)) (is this))?', '(', ')') == false
p properly_nested?('Hey!', '(', ')') == true
p properly_nested?(')Hey!(', '(', ')') == false
p properly_nested?('What ((is))) up(', '(', ')') == false