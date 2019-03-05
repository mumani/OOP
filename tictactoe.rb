#defining the player class object
class Player
  attr_accessor :name, :id, :state

  def initialize(name, id, state)
    @name = name    #player1 or player2
    @id =id         # 'X' or 'O'
    @state = state  # win! or lose!
  end

  #to display the winner/loser
  def to_s
    "#{name} has #{state}"
  end

end

#defining the playing board
class Board
  @@size = 9
  attr_accessor :curr_value

  def initialize(curr_value)
    @curr_value = curr_value
  end

  def vertical_check
  end

  def horizontal_check
  end

  def diagonol_check
  end

end

#method to declare a winner
def is_gameover?
end
