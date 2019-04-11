require 'rspec'
require_relative '../bin/displayController'

describe 'DisplayController' do

  it 'should display Welcome Message' do
    expect {DisplayController.welcome}.to output("Welcome to TIC TAC TOE\n").to_stdout
  end

  it 'should prompt player to make move' do
    expect {DisplayController.play('Ade')}.to output("Ade's turn, pick a position between 1 - 9\n").to_stdout
  end

end