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