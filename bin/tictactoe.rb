puts "Welcome to TIC TAC TOE"
$turn = 1
puts "Player 1 enter your name"
$player1 = gets.strip

puts "Player 2 enter your name"
$player2 = gets.strip

board = Array.new(9, " ")

#method to declare a winner
def is_gameover?(board)
  while $turn < 10
    play(board)
    if $turn >= 5
      hor_check(board)
      ver_check(board)
      #dia_check
    end

  end
  puts "Game Over!"
end

def play(board)
  if $turn.even?
    puts "#{$player2}'s turn, pick a position"
    pos = gets.strip
    if !(0..8).include? pos
      board[pos.to_i] = "x"
      $turn += 1
      puts print_board(board)
    else
      puts "Invalid position. Try Again!"
    end

  else
    puts "#{$player1}'s turn, pick a position"
    pos = gets.strip
    if !(0..8).include? pos
      board[pos.to_i] = "o"
      $turn += 1
      puts print_board(board)
    else
      puts "Invalid position. Try Again!"
    end
  end
end

def hor_check(arry)
  case
  when arry[0...3] == ['o', 'o', 'o']
    puts "#{$player1} WINS"
  when arry[3...6] == ['o', 'o', 'o']
    puts "#{$player1} WINS"
  when arry[6...9] == ['o', 'o', 'o']
    puts "#{$player1} WINS"
  when arry[0...3] == ['x', 'x', 'x']
    puts "#{$player2} WINS"
  when arry[3...6] == ['x', 'x', 'x']
    puts "#{$player2} WINS"
  when arry[6...9] == ['x', 'x', 'x']
    puts "#{$player2} WINS"
  end
end

def ver_check(arry)
  case
  when arry[0] + arry[3] + arry[6] == "ooo"
    puts "#{$player1} WINS"
  when arry[1] + arry[4] + arry[7] == "ooo"
    puts "#{$player1} WINS"
  when arry[2] + arry[5] + arry[8] == "ooo"
    puts "#{$player1} WINS"
  when arry[0] + arry[3] + arry[6] == "xxx"
    puts "#{$player2} WINS"
  when arry[1] + arry[4] + arry[7] == "xxx"
    puts "#{$player2} WINS"
  when arry[2] + arry[5] + arry[8] == "xxx"
    puts "#{$player2} WINS"
  end
end

def print_board(board)
  %{#{board[0]}|#{board[1]}|#{board[2]}
------
#{board[3]}|#{board[4]}|#{board[5]}
------
#{board[6]}|#{board[7]}|#{board[8]}}
end


is_gameover?(board)
