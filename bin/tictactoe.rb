puts "Welcome to TIC TAC TOE"
$turn = 1

#Registers users to the game
puts "Player 1 enter your name"
$player1 = gets.strip

puts "Player 2 enter your name"
$player2 = gets.strip

#initializes the game board values
board = Array.new(9, " ")

#method to declare a winner
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

#called for player turns
# takes in the board values as input
# checks the turn value to determine what player's turn it is
# checks player selected position to determine if it's a valid move
# updates and prints the board
def play(board)
  if $turn.even?
    puts "#{$player2}'s turn, pick a position between 1 - 9"
    pos = gets.strip
    pos = Integer(pos) rescue false

    if (1..9).to_a.include? pos and board[pos-1].eql?(" ")
      board[pos-1] = "x"
      $turn += 1
      puts print_board(board)
    else
      puts "Invalid position. Try Again!"
    end

  else
    puts "#{$player1}'s turn, pick a position between 1-9"
    pos = gets.strip
    pos = Integer(pos) rescue false
    if (1..9).include? pos and board[pos-1].eql?(" ")
      board[pos-1] = "o"
      $turn += 1
      puts print_board(board)
    else
      puts "Invalid position. Try Again!"
    end
  end
end

#checks for horizontal alignment
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

#checks for vertical alignment
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

#checks for diagonal alignment
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

#displays the game board
#using the passed in list items as cell values
def print_board(board)
  %{#{board[0]}|#{board[1]}|#{board[2]}
------
#{board[3]}|#{board[4]}|#{board[5]}
------
#{board[6]}|#{board[7]}|#{board[8]}}
end


is_gameover?(board)
