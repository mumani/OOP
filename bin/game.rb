require_relative '../lib/player'
require_relative '../bin/displayController'
require_relative '../bin/tictactoe'

DisplayController.welcome

DisplayController.player_name('Player 1')
player1 = Player.new(gets.strip, 'x')
DisplayController.player_name('Player 2')
player2 = Player.new(gets.strip, 'o')

players = [player1, player2]

new_game = TicTacToe.new(players)
new_game.game_over?