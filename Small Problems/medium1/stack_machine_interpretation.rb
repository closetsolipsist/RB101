require 'pry'
def apply_command!(register, stack, command)
  #binding.pry
  if stack.empty! && ["ADD", "SUB", "MULT",
                      "DIV", "MOD", "POP"].include?(command)
    "Error: #{command} called with empty stack"
  end
  case command
  when /-?[0-9]+/
    register[0] = command.to_i
  when "PUSH"
    stack.push(register[0])
  when "ADD"
    register[0] += stack.pop
  when "SUB"
    register[0] -= stack.pop
  when "MULT"
    register[0] *= stack.pop
  when "DIV"
    register[0] /= stack.pop
  when "MOD"
    register[0] %= stack.pop
  when "POP"
    register[0] = stack.pop
  when "PRINT"
    puts register[0]
  else
    return "Invalid command: #{command}"
  end
  nil
end

def minilang(commands)
  stack = []
  register = [0]
  commands.split.each do |command|
    apply_command!(register, stack, command)
  end
  puts ('-----')
  nil
end

register = [0]
stack = []

minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)

minilang('7 PUSH 4 PUSH 5 MULT POP SUB PUSH 3 ADD PRINT')