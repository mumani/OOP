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

  def move(arr)
    pos = gets
    if @name == player1
      arr.insert(pos, 'X')
    elsif @name == player2
      arr.insert(pos, 'O')
    end
  end

end