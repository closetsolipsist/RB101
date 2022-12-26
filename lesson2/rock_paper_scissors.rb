VALID_CHOICES = ["rock", "paper", "scissors"]

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

  if choice == computer_choice
    prompt "It's a tie."
  elsif (choice == "rock" && computer_choice == "scissors") ||
        (choice == "scissors" && computer_choice == "paper") ||
        (choice == "paper" && computer_choice == "rock")
    prompt "You win."
  else
    prompt "You lose."
  end
  prompt "Would you like to play again?"
  response = gets.chomp
  break unless response.downcase.start_with?('y')
end
