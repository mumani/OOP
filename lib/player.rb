#defining the player class object
class Player
  @@no_of_players = 0
  @@turn = 1
  attr_accessor :name, :id, :state

  def initialize(name)
    @name = name      #player1 or player2
    @id ="*not set*"         # 'X' or 'O'
    @state = state    # win! or lose!
    @@no_of_players += 1
  end

  def self.get_no
    @@no_of_players
  end

  def self.get_turn
    if @@turn.even?
      return "#{$player2.name}'s turn to play"
    else
      return "#{$player1.name}'s  turn to play"
    end
  end

  def set_id
    if @@no_of_players == 1
      @id = 'o'
    elsif @@no_of_players == 2
      @id = 'x'
    end
  end

  def play(board)
    if @@turn.even?
      puts "#{$player2.name}'s turn, pick a position between 1 - 9"
      pos = gets.strip
      pos = Integer(pos) rescue false

      if (1..9).to_a.include? pos and board[pos-1].eql?(" ")
        board[pos-1] = $player2.id
        @@turn += 1
        puts print_board(board)
      else
        puts "Invalid position. Try Again!"
      end

    else
      puts "#{$player1.name}'s turn, pick a position between 1-9"
      pos = gets.strip
      pos = Integer(pos) rescue false
      if (1..9).include? pos and board[pos-1].eql?(" ")
        board[pos-1] = $player1.id
        @@turn += 1
        puts print_board(board)
      else
        puts "Invalid position. Try Again!"
      end
    end
  end

end

print "Player 1 enter your name:"
# $player1 = Player.new.tap{ |player1| player1.name = gets.strip}
$player1 = Player.new(gets.strip)
$player1.set_id
print "Player 2 enter your name:"
$player2 = Player.new(gets.strip)
$player2.set_id

puts $player1.id
puts $player2.id
puts $player1.name
puts $player2.name

puts Player.get_no
Player.get_turn
