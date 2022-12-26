def prompt(message)
  puts "=> #{message}"
end

def remove_leading_characters(string, character)
  new_string = ''
  n = 0
  while string[n] == character && n < string.size
    n += 1
  end
  while n < string.size
    new_string << string[n]
    n += 1
  end
  new_string
end

def valid_number?(str)
  if str.remove_leading_characters(str, '0').empty?
    true
  else
    str.to_i.to_s == remove_leading_characters(str, '0')
  end
end

def number?(str)
  if valid_number?(str)
    true
  else

  end
end

def operation_to_gerund(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt "Welcome to Calculator! Enter your name"
name = ''
loop do
  name = gets.chomp
  if name.empty?
    prompt "Invalid name, please try again"
  else
    break
  end
end

prompt "Hi, #{name}!"

loop do
  number1 = nil
  number2 = nil

  loop do
    prompt "What's the first number?"
    number1 = gets.chomp
    if valid_number?(number1)
      break
    else
      prompt "Hmm... that doesn't look like a valid number."
    end
  end
  loop do
    prompt "What's the second number?"
    number2 = gets.chomp
    if valid_number?(number2)
      break
    else
      prompt "Hmm... that doesn't look like a valid number."
    end
  end
  operation_prompt = <<-MSG
What operation would you like to perform?
1) add
2) subtract
3) multiply
4) divide
  MSG
  prompt operation_prompt
  operation = ''
  loop do
    operation = gets.chomp
    if ['1', '2', '3', '4'].include?(operation)
      break
    else
      prompt "Must choose 1, 2, 3, or 4."
    end
  end
  prompt "#{operation_to_gerund(operation)} the two numbers"
  result = case operation
           when '1'
             number1.to_i + number2.to_i
           when '2'
             number1.to_i - number2.to_i
           when '3'
             number1.to_i * number2.to_i
           when '4'
             number1.to_f / number2.to_f
           end

  prompt "The result is #{result}"
  prompt "Would you like to make another calcultion (Y to continue)?"
  to_continue = gets.chomp
  break unless to_continue.downcase.start_with?('y')
end
prompt "Thank you for using the calculator. Goodbye!"
