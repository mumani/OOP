# This class is responsible for all user interaction
class DisplayController

  # displays the game board
  # using the passed in list items as cell values
  def self.print_board(board)
    %{#{board[0]}|#{board[1]}|#{board[2]}
  ------
  #{board[3]}|#{board[4]}|#{board[5]}
  ------
  #{board[6]}|#{board[7]}|#{board[8]}}
  end

  def self.welcome
    puts 'Welcome to TIC TAC TOE'
  end

end
