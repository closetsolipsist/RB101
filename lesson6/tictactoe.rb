INITIAL_SQUARE = ' '
SYMBOLS = ['X', 'O']
BOARD_SIDE_LENGTH = 3
GAMES_TO_WIN = 3
STARTING_SYMBOL = 'X'

def join_or(arr, separator = ', ', final_separator = 'or')
  arr_strs = arr.map(&:to_s)
  if arr.size == 1
    arr_strs[0]
  elsif arr.size == 2
    arr_strs[0] + " #{final_separator} " + arr_strs[1]
  else
    arr_strs[-1] = "#{final_separator} #{arr_strs[-1]}"
    arr_strs.join(separator)
  end
end

WELCOME_MESSAGE = "Welcome to tictactoe.rb!\n\n"\
                  "To enter each of your moves, you'll write "\
                  "the row and column number\nseparated by a space: "\
                  "the rows from top to bottom are " +
                  join_or((1..BOARD_SIDE_LENGTH).to_a, ', ', 'and') + ",\n"\
                  "and the columns from left to right are " +
                  join_or((1..BOARD_SIDE_LENGTH).to_a, ', ', 'and') + ".\n\n" \
                  "#{STARTING_SYMBOL} always goes first, and matches consist "\
                  "of #{GAMES_TO_WIN} games.\n\n"

MATCH_START_MESSAGE = <<HEREDOC
Would you like to choose who goes first in each game of the match, or
have it chosen randomly? (Type "choose" or "random" respectively.)
HEREDOC

def initial_board_state
  board = []
  BOARD_SIDE_LENGTH.times do
    board << []
    BOARD_SIDE_LENGTH.times do
      board[-1] << INITIAL_SQUARE
    end
  end
  board
end

def prompt_to_continue
  puts "Press enter to continue."
  gets
end

def get_valid_input(valid_input, msg_if_invalid = "Invalid input, try again.")
  choice = nil
  loop do
    choice = gets.chomp
    break if choice =~ valid_input
    puts msg_if_invalid
  end
  choice
end

def compute_winning_confifgurations
  rows = (0..BOARD_SIDE_LENGTH - 1).map do |row|
    (0..BOARD_SIDE_LENGTH - 1).map { |column| [row, column] }
  end
  columns = (0..BOARD_SIDE_LENGTH - 1).map do |column|
    (0..BOARD_SIDE_LENGTH - 1).map { |row| [row, column] }
  end
  diagonals = [(0..BOARD_SIDE_LENGTH - 1).map { |n| [n, n] }]
  diagonals << (0..BOARD_SIDE_LENGTH - 1).map do |n|
    [n, BOARD_SIDE_LENGTH - 1 - n]
  end
  rows + columns + diagonals
end

WINNING_CONFIGURATIONS = compute_winning_confifgurations

def display_row(row)
  puts '|' + row.join('|') + '|'
end

def display_board(board)
  system('clear')
  width = 2 * BOARD_SIDE_LENGTH + 1
  outer_row = '+' + '-' * (width - 2) + '+'
  inner_row = '-' * width
  puts outer_row
  board.each_with_index do |row, index|
    display_row(row)
    puts inner_row unless index == board.size - 1
  end
  puts outer_row
end

def other_symbol(given_symbol)
  SYMBOLS.find { |symbol| symbol != given_symbol }
end

def won?(board, symbol)
  WINNING_CONFIGURATIONS.any? do |squares|
    squares_on_board = squares.map { |row, col| board[row][col] }
    squares_on_board.all? { |square| square == symbol }
  end
end

def game_state(board, player_symbol)
  return :player if won?(board, player_symbol)
  return :computer if won?(board, other_symbol(player_symbol))
  if board.flatten.all? { |square| square != INITIAL_SQUARE }
    :draw
  else
    :in_progress
  end
end

def in_bounds(row, column)
  positions = (0..BOARD_SIDE_LENGTH - 1)
  positions.include?(row) && positions.include?(column)
end

def get_player_move(board, player_symbol)
  print "Enter your move (you are #{player_symbol}): "
  loop do
    player_input = get_valid_input(/^\d+ \d+$/)
    row, column = player_input.split(' ')
                              .map(&:to_i)
                              .map { |n| n - 1 }
    if !in_bounds(row, column)
      puts "Invalid coordinates, try again."
    elsif board[row][column] != INITIAL_SQUARE
      puts "Position already filled, try again."
    else
      return [row, column]
    end
  end
end

def threatened_wins(board, symbol)
  threatened_squares = []
  WINNING_CONFIGURATIONS.each do |line|
    symbols_on_line = line.map { |row, column| board[row][column] }
    if symbols_on_line.count(symbol) == BOARD_SIDE_LENGTH - 1 \
       && symbols_on_line.count(INITIAL_SQUARE) == 1
      blank_square_on_line = line.find do |row, column|
        board[row][column] == INITIAL_SQUARE
      end
      threatened_squares << blank_square_on_line
    end
  end
  threatened_squares
end

def empty_squares(board)
  positions = (0...BOARD_SIDE_LENGTH).to_a
  positions.product(positions)
           .select { |row, col| board[row][col] == INITIAL_SQUARE }
end

def get_computer_move(board, player_symbol)
  computer_symbol = other_symbol(player_symbol)
  winning_computer_moves = threatened_wins(board, computer_symbol)
  winning_player_moves = threatened_wins(board, player_symbol)
  empty_squares = empty_squares(board)
  middle_position = BOARD_SIDE_LENGTH / 2
  if !winning_computer_moves.empty?
    winning_computer_moves.sample
  elsif !winning_player_moves.empty?
    winning_player_moves.sample
  elsif board[middle_position][middle_position] == INITIAL_SQUARE
    [middle_position, middle_position]
  else
    empty_squares.sample
  end
end

def announce_game_result(final_state)
  case final_state
  when :player then puts "You won!"
  when :computer then puts "Computer won."
  when :draw then puts "It was a draw."
  end
end

def assign_player_symbol(assignment_method)
  case assignment_method
  when :choose
    puts "Would you like #{join_or(SYMBOLS)}?"
    get_valid_input(/^#{SYMBOLS.join('|')}$/)
  when :random
    SYMBOLS.sample
  end
end

def get_move(board, player_symbol, current_symbol)
  if current_symbol == player_symbol
    get_player_move(board, player_symbol)
  else
    get_computer_move(board, player_symbol)
  end
end

def play_game(player_symbol)
  board = initial_board_state
  current_symbol = STARTING_SYMBOL
  display_board(board)
  loop do
    row, column = get_move(board, player_symbol, current_symbol)
    board[row][column] = current_symbol
    current_symbol = other_symbol(current_symbol)
    display_board(board)
    if game_state(board, player_symbol) != :in_progress
      return game_state(board, player_symbol)
    end
  end
end

def announce_match_result(scores)
  if scores[:player] >= GAMES_TO_WIN
    puts "You won the match!"
  else
    puts "The computer won the match!"
  end
end

def display_score(scores)
  puts "Score - Player: #{scores[:player]}, Computer: #{scores[:computer]}"
end

def play_match
  puts MATCH_START_MESSAGE
  assignment_method = get_valid_input(/^(choose|random)$/).to_sym
  scores = { player: 0, computer: 0 }
  loop do
    system("clear")
    player_symbol = assign_player_symbol(assignment_method)
    outcome = play_game(player_symbol)
    scores[outcome] += 1 if scores.keys.include?(outcome)
    announce_game_result(outcome)
    display_score(scores)
    break if scores.values.max >= GAMES_TO_WIN
    prompt_to_continue
  end
  announce_match_result(scores)
end

puts WELCOME_MESSAGE
loop do
  play_match
  puts "Would you like to play again? "
  play_again = gets.chomp
  break unless play_again.downcase.start_with?('y')
  system('clear')
end
