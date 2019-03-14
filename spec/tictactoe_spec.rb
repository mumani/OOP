require 'rspec'

# Our RSpec test is here
require_relative '../lib/player'


describe 'Player' do

  it 'create a new user with name and id' do
    player = Player.new('Ade', 'x')
    expect(player.nil?).to eql(false)
  end

  it 'create a new user with name as a string' do
    player = Player.new('Ade', 'x')
    expect(player.name).to eql('Ade')
  end
end

