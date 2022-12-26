VALID_CHOICES = ["rock", "lizard", "spock", "scissors", "paper"]

def prompt(message)
  puts ">> #{message}"
end
loop do
  choice = nil
  loop do
    prompt "Choose one: #{VALID_CHOICES.join(', ')}"
    choice = gets.chomp
    if VALID_CHOICES.include?(choice)
      break
    else
      prompt "That's not a valid choice."
    end
  end

  computer_choice = VALID_CHOICES.sample
  puts "You chose #{choice} and computer chose #{computer_choice}."

  cyclic_distance = (VALID_CHOICES.index(computer_choice) - VALID_CHOICES.index(choice)) % 5
  if cyclic_distance == 1 || cyclic_distance == 3
    puts "You won."
  elsif cyclic_distance == 2 || cyclic_distance == 4
    puts "You lost."
  else
    puts "You tied."
  end
  prompt "Would you like to play again?"
  response = gets.chomp
  break unless response.downcase.start_with?('y')
end
