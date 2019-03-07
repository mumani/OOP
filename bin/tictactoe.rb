puts "Welcome to TIC TAC TOE"
$turn = 1
puts "Player 1 enter your name"
$player1 = gets.strip

puts "Player 2 enter your name"
$player2 = gets.strip

board = Array.new(8, " ")

#method to declare a winner
def is_gameover?(board)
  while $turn < 10
    play(board)
  end
  puts "Game Over"
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
      puts "Invalid position. Try Again"
    end

  else
    puts "#{$player1}'s turn, pick a position"
    pos = gets.strip
    if !(0..8).include? pos
      board[pos.to_i] = "o"
      $turn += 1
      puts print_board(board)
    else
      puts "Invalid position. Try Again"
    end
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







