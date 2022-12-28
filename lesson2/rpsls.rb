VALID_CHOICES = ["rock", "lizard", "spock", "scissors", "paper"]

def prompt(message)
  puts ">> #{message}"
end

def get_player_choice
  choice = nil
  abbreviations = ['r', 'l', 'sp', 'sc', 'p']
  loop do
    prompt "Choose one: (r)ock, (l)izard, (sp)ock, (sc)issors, (p)aper"
    prompt "(you can type the whole word or just the part in parentheses)"
    choice = gets.chomp
    if VALID_CHOICES.include?(choice)
      break
    elsif abbreviations.include?(choice)
      choice = VALID_CHOICES[abbreviations.index(choice)]
      break
    else
      prompt "That's not a valid choice."
    end
  end
  choice
end

def beats?(move1, move2)
  index1 = VALID_CHOICES.index(move1)
  index2 = VALID_CHOICES.index(move2)
  distance_around_circle = (index2 - index1) % 5
  distance_around_circle == 1 || distance_around_circle == 3
end

def play_round
  choice = get_player_choice
  computer_choice = VALID_CHOICES.sample
  prompt "You chose #{choice} and computer chose #{computer_choice}."
  if beats?(choice, computer_choice)
    prompt "You won this round."
    :player
  elsif beats?(computer_choice, choice)
    prompt "The computer won this round."
    :computer
  elsif choice == computer_choice
    prompt "This round was a tie."
    nil
  end
end

def play_match(score_to_win)
  round_number = 1
  scores = { player: 0, computer: 0 }
  while scores[:player] < score_to_win && scores[:computer] < score_to_win
    puts "Round #{round_number}:"
    winner = play_round
    scores[winner] += 1 if winner
    round_number += 1
  end
  if scores[:player] >= score_to_win
    prompt "You won the match!"
  else
    prompt "The computer won the match!"
  end
  prompt "The final score was: #{scores[:player]} for you "\
         "and #{scores[:computer]} for the computer"
end

prompt "Welcome to rpsls.rb"
prompt "Whoever wins 3 rounds first wins the match!"
loop do
  play_match(3)
  puts "-" * 60
  prompt "Would you like to play another match?"
  play_again = gets.chomp
  break unless play_again.downcase.start_with?('y')
end
