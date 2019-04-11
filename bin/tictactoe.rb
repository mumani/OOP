require_relative '../lib/player'
require_relative '../bin/displayController'
require_relative '../lib/board'

class TicTacToe
  attr_reader :players, :board, :current_player, :next_player, :game_on

  def initialize(players)
    @players = players
    @board = Array.new(9, ' ')
    @current_player, @next_player = players
    @game_on = true
  end

  # called for player turns
  # takes in the board values as input
  # checks the turn value to determine what player's turn it is
  # checks player selected position to determine if it's a valid move
  # updates and prints the board
  def play
    DisplayController.play(current_player.name)
    pos = DisplayController.position
    if valid_move(pos)
      @board[pos - 1] = @current_player.id
      switch
      DisplayController.print_board(board)
    else
      DisplayController.play
    end
  end

  def game_over?
    while game_on
      play
      if win_check
        DisplayController.game_over('W', @next_player.name)
        break
      elsif board.none?(' ')
        DisplayController.game_over('D')
        break
      end
    end
    DisplayController.game_over('G')
  end

  def win_check(board)
    hor_check = board[0...3].all?(next_player.id) || board[3...6].all?(next_player
                .id) || board[6...9].all?(next_player.id)
    vertical_check = board.values_at(0, 3, 6).all?(next_player.id) || board.values_at(1, 4, 7).all?(next_player.id) || board.values_at(2, 5, 8).all?(next_player.id)
    diagonal_check = board.values_at(0, 4, 8).all?(next_player.id) || board.values_at(2, 4, 6).all?(next_player.id)
    hor_check || vertical_check || diagonal_check
  end

  def valid_move(pos)
    ((1..9).to_a.include? pos) && @board[pos - 1].eql?(' ')
  end

  def switch
    @current_player, @next_player = @next_player, @current_player
  end
end

