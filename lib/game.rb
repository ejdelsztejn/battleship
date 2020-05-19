require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer_player'
require './lib/human_player'

class Game
  attr_reader :computer, :player
  def initialize(computer, player, turn)
    @computer = computer
    @player = player
    @turn = turn
  end

  def start
    puts "Welcome to BATTLESHIP."
    puts "Enter p to play. Enter q to quit."

    input = gets.chomp
    if input == 'p'
      computer.set_up_cruiser
      computer.set_up_submarine

      puts "The computers' ships have been placed on the board."
      puts "It is your turn to place your two ships."
      puts "The Cruiser is three units long and the Submarine is two units long."

      player.set_up_cruiser
      player.set_up_submarine

    end
  end


  def computer_ships_sunk?(player)

  end

  def player_ships_sunk?(player)
  end
end
