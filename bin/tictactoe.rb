puts "Welcome to TIC TAC TOE"

# puts "Player 1 enter your name"
# player1 = gets.strip
#
# puts "Player 2 enter your name"
# player2 = gets.strip

board = Array.new(8, " ")

def print_board(board)
  %{#{board[0]}|#{board[1]}|#{board[2]}
------
#{board[3]}|#{board[4]}|#{board[5]}
------
#{board[6]}|#{board[7]}|#{board[8]}}
end

board[1] = "x"
puts print_board(board)

#method to declare a winner
def is_gameover?
end
