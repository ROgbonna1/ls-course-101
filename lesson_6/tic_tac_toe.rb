require 'pry'
require 'pry-byebug'

game_board = { a1: "A1", b1: "B1", c1: "C1",
               a2: "A2", b2: "B2", c2: "C2",
               a3: "A3", b3: "B3", c3: "C3" }

def display_board(board)
  puts <<-HEREDOC
#{board[:a1]} | #{board[:b1]} | #{board[:c1]}
-------------
#{board[:a2]} | #{board[:b2]} | #{board[:c2]}
-------------
#{board[:a3]} | #{board[:b3]} | #{board[:c3]}

  HEREDOC
end

def prompt(msg)
  puts "==> #{msg}"
end

def valid_entry?(entry, board)
  board.values.include? entry.upcase
end

def user_move(space, board)
  board[space.downcase.to_sym] = "X "
end

def cpu_move(board)
  avail_spaces = board.values.select do |space|
    space.include?("A") || space.include?("B") || space.include?("C")
  end
  board[avail_spaces.sample.downcase.to_sym] = "O "
end

def tie_conditions(board)
  !board.values.any? { |space| space == "X " || space == "O " }
end

def winning_conditions(board)
  winning_condition = [[board[:a1], board[:b1], board[:c1]],
                       [board[:a2], board[:b2], board[:c2]],
                       [board[:a3], board[:b3], board[:c3]],
                       [board[:a1], board[:a2], board[:a3]],
                       [board[:b1], board[:b2], board[:b3]],
                       [board[:c1], board[:c2], board[:c3]],
                       [board[:a1], board[:b2], board[:c3]],
                       [board[:a3], board[:b2], board[:c1]]]
  winning_condition
end

def winner(board) # returns character of winning player ('x' or 'o')
  winning_move = winning_conditions(board).find do |positions|
    positions.uniq.length == 1
  end
  winning_move[0] unless winning_move.nil?
end

user_selection = " "

# loop the process of asking for user input and then randomly assigning CPU
loop do
  display_board(game_board)

  # validity check for user input
  loop do
    prompt "User: Pick a spot"
    user_selection = gets.chomp
    break if valid_entry?(user_selection, game_board)
    prompt "Choice not valid. Please enter a selection from the game board."
  end

  user_move(user_selection, game_board)
  break if !!winner(game_board) || tie_conditions(game_board)
  prompt "CPU's turn!..."
  sleep 0.5
  cpu_move(game_board)
end

# End game by either naming the tie or the winner.
if tie_conditions(game_board)
  prompt "It's a tie!"
elsif !!winner(game_board)
  prompt "And the winner is.... #{winner(game_board)}'s!"
  sleep 0.5
  winner(game_board) == "X " ? prompt("Congratulations!") : prompt("You suck!")
end
