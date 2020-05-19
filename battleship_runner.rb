require './lib/game'

computer = ComputerPlayer.new
player = HumanPlayer.new

game = Game.new(computer, player)
game.start
