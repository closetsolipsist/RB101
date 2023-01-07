require "pry"
require "pry-byebug"

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                   [1, 4, 7], [2, 5, 8], [3, 6, 9],
                   [1, 5, 9], [3, 5, 7]]

def joinor(arr, separator = ', ', final_separator = 'or')
  arr = arr.map(&:to_s)
  if arr.size == 1
    arr[0]
  elsif arr.size == 2
    arr[0] + ' #{final_separator} ' + arr[1]
  else
    arr[-1] = "#{final_separator} #{arr[-1]}"
    arr.join(separator)
  end
end

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is an #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def threatened_wins(board, symbol)
  threatened_squares = []
  WINNING_LINES.each do |line|
    if board.values_at(*line).count(symbol) == 2 \
       && board.values_at(*line).count(INITIAL_MARKER) == 1
      threatened_squares << line.find { |square| board[square] == INITIAL_MARKER }
    end
  end
  threatened_squares
end     

def computer_places_piece!(brd)
  if !(threatened_wins(brd, COMPUTER_MARKER).empty?)
    square = threatened_wins(brd, COMPUTER_MARKER).sample
  elsif !(threatened_wins(brd, PLAYER_MARKER).empty?)
    square = threatened_wins(brd, PLAYER_MARKER).sample
  elsif brd[5] == INITIAL_MARKER
    square = 5
  else
    square = empty_squares(brd).sample
  end
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd) == []
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd[line[0]] == PLAYER_MARKER &&
      brd[line[1]] == PLAYER_MARKER &&
      brd[line[2]] == PLAYER_MARKER
      return 'Player'
    elsif brd[line[0]] == COMPUTER_MARKER &&
        brd[line[1]] == COMPUTER_MARKER &&
        brd[line[2]] == COMPUTER_MARKER
        return 'Computer'
    end
  end
  nil
end

def alternate_player(current_player)
  current_player == 'player' ? 'computer' : 'player'
end

def place_piece!(board, current_player)
  if current_player == "player"
    player_places_piece!(board)
  else
    computer_places_piece!(board)
  end
end

def play_game
  puts "Who goes first (player, computer, or random)?"
  current_player = gets.chomp
  current_player = ["player", "computer"].sample if current_player == "random"

  board = initialize_board

  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)
  
  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
    detect_winner(board)
  else
    prompt "It's a tie!"
    nil
  end
end

def announce_score(scores)
  puts "Current score is Player: #{scores[:Player]}, " +
         "Computer: #{scores[:Computer]}"
  puts "(press enter to continue)"
  gets
end

def play_match
  puts "First to win 5 games wins the match!"
  scores = {Player: 0, Computer: 0}
  while scores.values.max < 5
    winner = play_game
    scores[winner.to_sym] += 1 if winner
    announce_score(scores)
  end
  if scores[:Player] >= 5
    puts "Player won match!"
  else
    puts "Computer won match!"
  end
end

loop do
  play_match
  prompt "Play another match? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Good bye!"