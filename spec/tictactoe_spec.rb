require 'rspec'

# Our RSpec test is here
require_relative '../lib/player'


describe player = Player.new('Ade', 'x') do

  it 'create a new user with name and id' do
    expect(player.nil?).to eql(false)
  end

  it 'create a new user with name as a string' do
    expect(player.name).to eql('Ade')
  end

  it 'expects turn to be 1 for single player creation' do
    expect(Player.get_no).to eql(1)
  end

end

