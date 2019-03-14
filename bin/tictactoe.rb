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
    puts "#{@current_player.name}'s turn, pick a position between 1 - 9"
    pos = DisplayController.position
    if valid_move(pos)
      @board[pos - 1] = @current_player.id
      switch
      puts DisplayController.print_board(board)
    else
      puts 'Invalid position. Try Again!'
    end
  end

  def game_over?
    while game_on
      play
    end
  end

  def valid_move(pos)
    ((1..9).to_a.include? pos) && @board[pos - 1].eql?(' ')
  end

  def switch
    @current_player, @next_player = @next_player, @current_player
  end
end

DisplayController.welcome


print 'Player 1 enter your name:'
player1 = Player.new(gets.strip, 'x')
print 'Player 2 enter your name:'
player2 = Player.new(gets.strip, 'o')

players = [player1, player2]


# method to declare a winner
def is_gameover?(board)
  while $turn < 10
    play(board)
    if $turn >= 5
      if hor_check(board) == true
        break
      end
      if ver_check(board) == true
        break
      end
      if dia_check(board) == true
        break
      end
    end
    if $turn == 10
      puts "DRAW!"
      break
    end
  end
  puts "Game Over!"
end


# checks for horizontal alignment
def hor_check(arry)
  esc = false
  case
  when arry[0...3] == ['o', 'o', 'o']
    puts "#{$player1} WINS!"
    esc = true
  when arry[3...6] == ['o', 'o', 'o']
    puts "#{$player1} WINS!"
    esc = true
  when arry[6...9] == ['o', 'o', 'o']
    puts "#{$player1} WINS!"
    esc = true
  when arry[0...3] == ['x', 'x', 'x']
    puts "#{$player2} WINS!"
    esc = true
  when arry[3...6] == ['x', 'x', 'x']
    puts "#{$player2} WINS!"
    esc = true
  when arry[6...9] == ['x', 'x', 'x']
    puts "#{$player2} WINS!"
    esc = true
  end
  return esc
end

# checks for vertical alignment
def ver_check(arry)
  esc = false
  case
  when arry[0] + arry[3] + arry[6] == "ooo"
    puts "#{$player1} WINS!"
    esc = true
  when arry[1] + arry[4] + arry[7] == "ooo"
    puts "#{$player1} WINS!"
    esc = true
  when arry[2] + arry[5] + arry[8] == "ooo"
    puts "#{$player1} WINS!"
    esc = true
  when arry[0] + arry[3] + arry[6] == "xxx"
    puts "#{$player2} WINS!"
    esc = true
  when arry[1] + arry[4] + arry[7] == "xxx"
    puts "#{$player2} WINS!"
    esc = true
  when arry[2] + arry[5] + arry[8] == "xxx"
    puts "#{$player2} WINS!"
    esc = true
  end
  return esc
end

# checks for diagonal alignment
def dia_check(arry)
  esc = false
  case
  when arry[0] + arry[4] + arry[8] == "ooo"
    puts "#{$player1} WINS!"
    esc = true
  when arry[2] + arry[4] + arry[6] == "ooo"
    puts "#{$player1} WINS!"
    esc = true
  when arry[0] + arry[4] + arry[8] == "xxx"
    puts "#{$player2} WINS!"
    esc = true
  when arry[2] + arry[4] + arry[6] == "xxx"
    puts "#{$player2} WINS!"
    esc = true
  end
end



new_game = TicTacToe.new(players)
new_game.game_over?



