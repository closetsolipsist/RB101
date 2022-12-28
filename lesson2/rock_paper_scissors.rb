VALID_CHOICES = ["rock", "paper", "scissors"]

def prompt(message)
  puts "=> #{message}"
end

def beats?(move1, move2)
  move1 == 'rock' && move2 == 'scissors' ||
    move1 == 'paper' && move2 == 'rock' ||
    move1 == 'scissors' && move2 == 'paper'
end

def display_results(choice, computer_choice)
  if beats?(choice, computer_choice)
    prompt "You won!"
  elsif beats?(computer_choice, choice)
    prompt "Computer won"
  elsif choice == computer_choice
    prompt "It's a tie"
  end
end

loop do
  choice = nil
  loop do
    prompt "Choose one: #{VALID_CHOICES.join(', ')}"
    choice = gets.chomp
    if VALID_CHOICES.include?(choice)
      break
    else
      prompt "That's not a valid choice"
    end
  end

  computer_choice = VALID_CHOICES.sample

  puts "You chose #{choice} and computer chose #{computer_choice}"
  display_results(choice, computer_choice)

  prompt "Do you want to play again?"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
