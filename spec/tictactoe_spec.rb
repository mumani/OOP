require 'rspec'
require_relative '../bin/tictactoe'


describe 'TicTacToe' do
  let!(:player1) { Player.new('Tester1', 'o') }
  let!(:player2) { Player.new('Tester2', 'x') }
  let!(:players) { [player1, player2] }

  #before(:each) do
  #  @game = TicTacToe.new(players)
  #end
  let(:game) { TicTacToe.new(players) }

  
  it 'should start the game' do
    expect(game.game_on).to be_truthy
  end

  it 'should only take numbers between 1 and 9' do
    expect(game.valid_move(10)).to be_falsey
  end

  it 'should only pass numbers between 1 and 9' do
    expect(game.valid_move(1)).to be_truthy
  end
  

  it 'should pass the players attributes' do
    expect(game.players).to eq players
  end
    
  it 'initialize with an empty board' do
    # game.board = ['o', 'o', 'o',' ', 'x', 'x', 'o', 'x', ' ']
    # p game.board
    expect(game.board).to eq [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  let!(:switch) { game.switch}
  it 'switches the players' do    
    expect(game.players[0]).to eq switch[1]
  end

  
  it 'should return true for winnig combinations' do
    expect(game.win_check(['o', 'o', 'o',' ', 'x', 'x', 'o', 'x', ' '])).to eq true
  end

  it 'should return false for bad combinations' do
    expect(game.win_check(['o', 'o', 'x',' ', 'x', 'x', 'o', 'x', ' '])).to eq false
  end

end


