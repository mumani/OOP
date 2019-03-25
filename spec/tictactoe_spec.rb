require 'rspec'
require '../bin/tictactoe'


describe 'TicTacToe' do
  let(:player1) { Player.new('Tester1', 'o') }
  let(:player2) { Player.new('Tester2', 'x') }
  let(:players) { [player1, player2] }

  before(:each) do
    @game = TicTacToe.new(players)
  end
  # let(:game) { TicTacToe.new(players) }

  it 'should start the game' do
    @game.game_on.should_not be_false
  end

  it 'should only take numbers between 1 and 9' do
    @game.valid_move(10).should be_falsey
  end
end

