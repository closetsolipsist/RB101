SYMBOLS = ['X', 'O']
BOARD_SIDE_LENGTH = 3
STARTING_SYMBOL = 'X'
WELCOME_MESSAGE = <<HEREDOC
Welcome to tictactoe.rb!
To enter each of your moves, you'll write row number,column number
Where the rows from top to bottom are 1, 2, and 3 and the columns
from left to right are 1, 2, and 3
Would you like X or O? (X goes first)
HEREDOC

board = [[' ', ' ', ' '],
         [' ', ' ', ' '],
         [' ', ' ', ' ']]

def display_board(board)
  outer_row = '+-----+'
  inner_row = '-------'
  puts outer_row
  board.each_with_index do |row, index|
    puts '|' + row.join('|') + '|'
    puts inner_row unless index == board.size - 1
  end
  puts outer_row
end

def other_symbol(given_symbol)
  SYMBOLS.find { |symbol| symbol != given_symbol }
end

def won?(board, symbol)
  winning_configurations = [[[0, 0], [1, 1], [2, 2]],
                            [[0, 2], [1, 1], [2, 0]]]
  (0...BOARD_SIDE_LENGTH).each do |n|
    winning_configurations << [[n, 0], [n, 1], [n, 2]]
    winning_configurations << [[0, n], [1, n], [2, n]]
  end
  winning_configurations.any? do |squares|
    squares_on_board = squares.map { |row, col| board[row][col] }
    squares_on_board.all? { |square| square == symbol }
  end
end

def game_state(board)
  if won?(board, 'X')
    'X'
  elsif won?(board, 'O')
    'O'
  elsif board.flatten.all? { |square| square != ' ' }
    'draw'
  else
    'in progress'
  end
end

def get_player_move(board)
  loop do
    print "Enter your move: "
    player_input = gets.chomp
    if player_input =~ /[1-3],[1-3]/
      row, column = player_input.split(',').map(&:to_i).map { |n| n - 1 }
      if board[row][column] == ' '
        return [row, column]
      else
        puts "Position already filled, try again."
      end
    else
      puts "Invalid move format, try again."
    end
  end
end

def get_computer_move(board)
  positions = (0...BOARD_SIDE_LENGTH).to_a
  empty_squares = positions.product(positions)
                           .select { |row, col| board[row][col] == ' ' }
  empty_squares.sample
end

puts WELCOME_MESSAGE
player_symbol = gets.chomp
computer_symbol = other_symbol(player_symbol)
current_symbol = STARTING_SYMBOL
display_board(board)
loop do
  if current_symbol == player_symbol
    row, column = get_player_move(board)
  else
    row, column = get_computer_move(board)
  end
  board[row][column] = current_symbol
  system("clear")
  display_board(board)
  current_symbol = other_symbol(current_symbol)
  if game_state(board) != "in progress"
    break
  end
end
if game_state(board) == player_symbol
  puts "You won!"
elsif game_state(board) == computer_symbol
  puts "Computer won"
else
  puts "It was a draw"
end
