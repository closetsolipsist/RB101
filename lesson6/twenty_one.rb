require("pry")
SUITS = ['♥', '♠', '♣', '♦']
RANKS = ['A', '2', '3', '4', '5', '6', '7', '8', '9', 'J', 'Q', 'K']

MAX_SCORE_BEFORE_BUST = 21
MAX_SCORE_BEFORE_STAY = 17

def prompt(msg)
  puts ">> #{msg}"
end

def joinor(arr, separator = ', ', final_separator = 'or')
  arr = arr.map(&:to_s)
  if arr.size == 1
    arr[0]
  elsif arr.size == 2
    arr[0] + " #{final_separator} " + arr[1]
  else
    arr[-1] = "#{final_separator} #{arr[-1]}"
    arr.join(separator)
  end
end

def deal!(table, hand, num_cards, verbose = false)
  num_cards.times do
    dealt_card = table["deck"].sample
    table["deck"].delete(dealt_card)
    prompt "#{hand.capitalize} draws a #{dealt_card}" if verbose
    table[hand] << dealt_card
  end
  nil
end

def value(card)
  rank = card[0]
  if rank.to_i.to_s == rank then rank.to_i
  elsif rank != 'A' then 10
  elsif rank == 'A' then 11
  end
end

def hand_total(hand)
  total = 0
  num_aces = 0
  hand.each do |card|
    total += value(card)
    if card[0] == 'A'
      num_aces += 1
    end
  end
  num_aces.times do
    total -= 10 if total > MAX_SCORE_BEFORE_BUST
  end
  total
end

def busted?(hand)
  hand_total(hand) > MAX_SCORE_BEFORE_BUST
end

def player_choice
  prompt "Would you like to hit or stay?"
  loop do
    choice = gets.chomp.downcase
    if ["hit", "stay"].include?(choice)
      return choice
    else
      prompt "Invalid choice, try again"
    end
  end
end

def obscure_hidden_card(hand)
  hand[0..-2] + ["an unknown card"]
end

def display_hand(table, player, reveal_hidden_card = false)
  if player == "player"
    prompt "You have " + joinor(table["player"], ', ', 'and')
  elsif player == "dealer"
    if reveal_hidden_card
      prompt "Dealer has " + joinor(table["dealer"], ', ', 'and')
    else
      obscured_hand = obscure_hidden_card(table["dealer"])
      prompt "Dealer has #{joinor(obscured_hand, ', ', 'and')}"
    end
  end
end

def display_board_state(table, reveal_hidden_card = false)
  display_hand(table, "player", reveal_hidden_card)
  display_hand(table, "dealer", reveal_hidden_card)
end

def player_turn!(table)
  while hand_total(table["player"]) <= MAX_SCORE_BEFORE_BUST
    display_board_state(table)
    choice = player_choice
    break if choice == "stay"
    deal!(table, "player", 1, true)
  end
  table
end

def dealer_turn!(table)
  if hand_total(table["dealer"]) < MAX_SCORE_BEFORE_STAY
    display_hand(table, "dealer", true)
  end
  while hand_total(table["dealer"]) < MAX_SCORE_BEFORE_STAY
    deal!(table, "dealer", 1, true)
  end
end

def compare_hands(table)
  case hand_total(table["player"]) <=> hand_total(table["dealer"])
  when 1 then "Player wins"
  when 0 then "It's a draw"
  when -1 then "Dealer wins"
  end
end

def initialize_table
  table = {}
  table["deck"] = RANKS.product(SUITS).map { |suit, rank| suit + rank }
  table["player"] = []
  table["dealer"] = []
  table
end

def play_game
  table = initialize_table
  deal!(table, "player", 2)
  deal!(table, "dealer", 2)
  player_turn!(table)
  if busted?(table["player"])
    puts "Player busts."
    display_hand(table, "dealer", true)
    return
  end
  dealer_turn!(table)
  if busted?(table["dealer"])
    prompt "Dealer busts" if busted?(table["dealer"])
    return
  end
  display_board_state(table, true)
  puts compare_hands(table)
end

play_game
