require './lib/game'

computer = ComputerPlayer.new
player = HumanPlayer.new

Game.new(computer, player)
