VALID_CHOICES = ["rock", "paper", "scissors", "spock", "lizard"]
SCORE_TO_WIN_MATCH = 3

def prompt(message)
  puts ">> #{message}"
end

def unabbreviate(choice)
  abbreviations = ['r', 'p', 'sc', 'sp', 'l']
  if abbreviations.include?(choice)
    VALID_CHOICES[abbreviations.index(choice)]
  else
    choice
  end
end

def get_player_choice
  choice = nil
  loop do
    prompt "Choose one: (r)ock, (l)izard, (sp)ock, (sc)issors, (p)aper"
    prompt "(you can type the whole word or just the part in parentheses)"
    choice = unabbreviate(gets.chomp)
    if VALID_CHOICES.include?(choice)
      break
    else
      prompt "That's not a valid choice."
    end
  end
  choice
end

def beats?(move1, move2)
=begin
A move beats another precisely when the second is 2 or 4 step from the first
moving clockwise around the circle depicted at the following link:
https://web.archive.org/web/20181217114425/http://www.samkass.com/theories/RPSSL.html.
=end
  index1 = VALID_CHOICES.index(move1)
  index2 = VALID_CHOICES.index(move2)
  distance_around_circle = (index2 - index1) % 5
  distance_around_circle == 2 || distance_around_circle == 4
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

def announce_match_result(scores)
  if scores[:player] > scores[:computer]
    prompt "You won the match!"
  else
    prompt "The computer won the match!"
  end
  prompt "The final score was: #{scores[:player]} for you "\
         "and #{scores[:computer]} for the computer"
end

def play_match(score_to_win)
  round_number = 1
  scores = { player: 0, computer: 0 }
  while scores[:player] < score_to_win && scores[:computer] < score_to_win
    puts "Round #{round_number}:"
    puts "Score - player: #{scores[:player]}, computer: #{scores[:computer]}"
    winner = play_round
    _ = gets
    system "clear"
    scores[winner] += 1 if winner
    round_number += 1
  end
  announce_match_result scores
end
system "clear"
prompt "Welcome to rpsls.rb"
prompt "Whoever wins #{SCORE_TO_WIN_MATCH} rounds first wins the match!"
loop do
  play_match(SCORE_TO_WIN_MATCH)
  puts "-" * 60
  prompt "Would you like to play another match?"
  play_again = gets.chomp
  break unless play_again.downcase.start_with?('y')
  system "clear"
end
